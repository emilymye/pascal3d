class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string  :filepath,      :null => false
      t.string  :category_name, :null => false
      t.timestamps
    end

    add_index :images, :filepath, :unique => true
    add_index :images, :category_name
  end
end
