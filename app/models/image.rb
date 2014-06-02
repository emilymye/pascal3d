class Image < ActiveRecord::Base
  belongs_to :category, :foreign_key => :category_name, :primary_key => :name
  has_many :annotations
end
