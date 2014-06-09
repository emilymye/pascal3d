# == Schema Information
#
# Table name: meshes
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
#  mesh               :string(255)      
#  elevation          :decimal          
#  azimuth            :decimal          
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
        self.errors[:base] << "Invalid keypoint value keys" unless v.length == 5 and (v.keys - ["x","y","z","px","py"]).empty?
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

    return annotation
  end

  def update_from_hit(type, answers)
    if type == "mesh"
      self.mesh = answers["mesh_file"]
      p "Error, no such mesh #{@annotation.mesh}" and return unless category.meshes.include?(answers["mesh_file"])
    elsif type == "orientation"
      self.elevation = answers["elevation"]
      self.azimuth = answers["azimuth"]
      self.keypoint_matches = JSON.parse(answers["keypoint_matches"])
      self.keypoint_matches.each do |k,v|
        v["px"] = nil
        v["py"] = nil
      end
    elsif type == "keypoints"
      self.keypoint_matches = JSON.parse(answers["keypoint_matches"])
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
      p "Annotation"
    end

    hit_params = params[type]|| YAML::load_file('config/hits/#{ type }.yml')
    url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/edit_annotation/#{id}"

    begin
      rturk_hit = create_hit(hit_params, url)
      self.submitted = true
      self.save!
      p "Submitted #{type} HIT for annotation #{id} with id #{rturk_hit.id} "
      return rturk_hit
    rescue StandardError => e
      p e
      p "Error submitting annotation #{id} - rerun to try again" and return
    end
  end


  def export
    # image_file, category_name, x0, x1, y0, y1, mesh, elevation, azimuth, keypoint_matches, created_at, updated_at
    
    arr = [ 
      image_file,
      category_name,
      x0, x1, y0, y1,
      mesh,
      elevation,
      azimuth,
      keypoints.count
    ]

    keypoint_matches.each do |k,v| 
      arr << k << v.px << v.py << v.x << v.y << v.z
    end

    return arr
  end

end
