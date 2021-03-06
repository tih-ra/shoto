class CreateWorkPhotos < ActiveRecord::Migration
  def self.up
    create_table :work_photos do |t|
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.column :type, :string
      t.column :work_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :work_photos
  end
end
