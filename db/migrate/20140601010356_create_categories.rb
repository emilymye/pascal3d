class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name, :null => false
      t.text    :keypoints
      t.text    :meshes
      t.timestamps
    end

    add_index :categories, :name, :unique => true
  end
end
