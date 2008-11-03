class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.column :title, :string
      t.column :slug, :string
      t.column :description, :text
      t.column :user_id, :integer
      t.column :cover, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
