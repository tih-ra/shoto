class AddIsFreezeFramesToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :is_freeze_frames, :boolean, :default=>false
  end

  def self.down
    remove_column :albums, :is_freeze_frames
  end
end
