class AddCommentsStatusToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :comment_status, :integer, :default=>0
  end

  def self.down
    remove_column :posts, :comment_status
  end
end
