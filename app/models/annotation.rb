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
    :completed    => 4
  }

  validates :mesh,      :with => :check_mesh
  validates :keypoint_matches, :with => :check_keypoints
  validates_presence_of :elevation, :azimuth, :with => :has_orientation?

  
  def approve?
    true
  end

  def check_mesh
    return unless has_mesh?
    p self.category.meshes
    p self
    if !self.category.meshes.include?(self.mesh)
      self.errors[:base] << "Invalid mesh #{self.mesh} for category #{self.category.name}"
    end
  end

  def check_keypoints
    return unless has_orientation?
    valid_names = self.category.keypoints

    self.keypoint_matches.each do |k,v|
      self.errors[:base] << "Invalid keypoint name #{k}" unless valid_names.include?(k)
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

end
