# == Schema Information
#
# Table name: meshes
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null, index
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null

class Category < ActiveRecord::Base
  serialize :keypoints, Array
  serialize :meshes, Array

  has_many :annotations, :foreign_key => :category_name, :primary_key => :name
end
