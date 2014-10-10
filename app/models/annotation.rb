# == Schema Information
#
# Table name: annotations 
#
#  id                 :integer          not null, primary key
#  submitted          :boolean          not null, default false
#  stage              :integer          not null, default 0 (:mesh)
#  image_file         :string(255)      not null
#  category_name      :string(255)      not null, foreign key
#  x0                 :integer          not null
#  x1                 :integer          not null
#  y0                 :integer          not null
#  y1                 :integer          not null
#  image_height	      :integer		null
#  image_width	      :integer		null
#  mesh               :string(255)      
#  elevation          :decimal          
#  azimuth            :decimal
#  bbox_validity      :boolean	 	null
#  mesh_validity      :boolean 		null          
#  keypoint_matches   :text 
#  created_at         :datetime         not null
#  updated_at         :datetime         not null

require 'json'

class Annotation < ActiveRecord::Base
  belongs_to :category, :foreign_key => :category_name, :primary_key => :name

  serialize :keypoint_matches, Hash

  STAGES = {
    :mesh         => 1,
    :orientation  => 2,
    :keypoints    => 3,
    :complete     => 4
  }

  validates :mesh,      :with => :check_mesh
  validates :keypoint_matches, :with => :check_keypoints
  validates_presence_of :elevation, :azimuth, :with => :has_orientation?
  validates :stage, :numericality => { only_integer: true, 
                                       greater_than_or_equal_to: STAGES[:mesh],
                                       less_than_or_equal_to: STAGES[:complete]
                                     }
  
  def approve?
    true
  end

  def check_mesh
    return unless has_mesh?
    if !self.category.meshes.include?(self.mesh)
      self.errors[:base] << "Invalid mesh #{self.mesh} for category #{self.category.name}"
    end
  end

  def check_keypoints
    return unless has_orientation?
    valid_names = self.category.keypoints

    self.keypoint_matches.each do |k,v|
      self.errors[:base] << "Invalid keypoint name #{k}" unless valid_names.include?(k)
      if v.class == Hash
	self.errors[:base] << "Invalid keypoint value keyts" unless v.length == 6 and (v.keys - ["x","y","z","px","py","property"]).empty?
        # self.errors[:base] << "Invalid keypoint value keys" unless v.length == 5 and (v.keys - ["x","y","z","px","py"]).empty?
      else 
        self.errors[:base] << "Invalid keypoint - not hash" unless @v.class == Hash
      end

    end
  end

  def has_mesh?
    return self.stage > STAGES[:mesh]
  end

  def has_orientation?
    return self.stage > STAGES[:orientation]
  end

  def has_keypoints?
    return self.stage > STAGES[:keypoints]
  end

  def self.new_from_hit(answers)
    annotation = Annotation.new
    annotation.image_file = answers["image_file"]
    annotation.category_name = answers["category_name"]
    annotation.x0 = answers["x0"].to_i
    annotation.x1 = answers["x1"].to_i
    annotation.y0 = answers["y0"].to_i
    annotation.y1 = answers["y1"].to_i
    annotation.bbox_validity = answers["bbox_validity"]

    return annotation
  end

  def update_from_hit(type, answers)
    if type == "mesh"
      self.mesh = answers["mesh_file"]
      p "Error, no such mesh #{@annotation.mesh}" and return unless category.meshes.include?(answers["mesh_file"])
    elsif type == "orientation"
      self.elevation = answers["elevation"]
      self.azimuth = answers["azimuth"]
      self.bbox_validity = answers["bbox_validity"]
      self.mesh_validity = answers["mesh_validity"]
      self.keypoint_matches = JSON.parse('{}') # JSON.parse(answers["keypoint_matches"])
      self.keypoint_matches.each do |k,v|
        v["px"] = nil
        v["py"] = nil
      end
    elsif type == "keypoints"
      self.mesh_validity = answers["mesh_validity"]
      tmp = "#{answers["keypoint_matches"]}".split("|")
      p "tmp[0] is"
      p "#{tmp[0]}"
      p "#{tmp}"

      pattern = /"key\d":{.*?},?/ # p "#{tmp2[pattern]}"
      tmp2 = tmp[0].gsub(pattern, '')
      # p "#{tmp2}"
      # p "#{tmp[0]}"

      if answers["category_name"] == "calculator" 
        self.keypoint_matches = JSON.parse(tmp2)
      else
        self.keypoint_matches = JSON.parse(tmp[0])
        # self.keypoint_matches = JSON.parse(answers["keypoint_matches"])
      end

    end

    self.stage = self.stage + 1
  end

  def submit_hit(params)
    case stage
    when STAGES[:mesh]
      type = "mesh"
    when STAGES[:orientation]
      type = "orientation"
    when STAGES[:keypoints]
      type = "keypoints"
    when STAGES[:complete]
      p "Annotation is complete, no need to submit HIT"
    end

    filename = "config/hits/#{ type }.yml"
    hit_params = params[type]|| YAML::load_file(filename)
   
    case type
    when "mesh"
      url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/mesh_annotation/#{id}"
    when "orientation"
      url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/orientation_annotation/#{id}"
    when "keypoints"
      url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/keypoints_annotation/#{id}"
    else
      url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/edit_annotation/#{id}"
    end 
    #if type == "mesh"
    #  url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/mesh_annotation/#{id}"
    #else
    #  url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/edit_annotation/#{id}"
    #end

    begin
      RTurk::Utilities.retry_on_unavailable(1) do
        rturk_hit = create_hit(hit_params, url)
        self.submitted = true
        self.save!
        p "Submitted #{type} HIT for annotation #{id} with id #{rturk_hit.id} "
        return rturk_hit
      end
    rescue RTurk::RTurkError => e
      p e
      p "Error submitting annotation #{id} - rerun to try again" and return
    end
  end


  def export
    # id, image_file, category_name, x0, x1, y0, y1, mesh, elevation, azimuth, bbox_validity, mesh_validity, keypoint_matches, created_at, updated_at
    
    arr = [ 
      id,
      image_file,
      category_name,
      x0, x1, y0, y1,
      mesh,
      elevation.to_f,
      azimuth.to_f,
      bbox_validity,
      mesh_validity,
      keypoint_matches.count
    ]

    keypoint_matches.each do |k,v| 
      arr << k << v["px"] << v["py"] << v["x"] << v["y"] << v["z"] << v["property"]
    end

    return arr
  end

end
