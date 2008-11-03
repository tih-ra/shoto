class AddIsVideoToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :is_video, :boolean, :default=>false
  end

  def self.down
    remove_column :posts, :is_video
  end
end
