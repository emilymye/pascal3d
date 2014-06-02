class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.boolean   :submitted, :null => false, :default => 0
      t.integer   :stage,  :null => false, :default => 1
      
      t.references  :image, :null => false
      t.integer     :x0, :null => false
      t.integer     :x1, :null => false
      t.integer     :y0, :null => false
      t.integer     :y1, :null => false

      t.string      :mesh
      t.decimal     :elevation, :default => 0.0
      t.decimal     :azimuth,   :default => 0.0
      t.text        :keypoint_matches
      t.timestamps
    end

    add_index :annotations, :image_id
    add_index :annotations, :submitted
    add_index :annotations, :stage
  end
end
