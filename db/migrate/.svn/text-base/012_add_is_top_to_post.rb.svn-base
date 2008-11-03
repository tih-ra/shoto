class AddIsTopToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :is_top, :boolean, :default=>false
  end

  def self.down
    remove_column :posts, :is_top
  end
end
