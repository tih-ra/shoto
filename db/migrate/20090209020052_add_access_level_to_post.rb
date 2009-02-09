class AddAccessLevelToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :access_level, :integer, :default=>0
  end

  def self.down
    remove_column :posts, :access_level
  end
end
