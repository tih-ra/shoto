class AddInfoUrlToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :info_url, :string
  end

  def self.down
    remove_column :events, :info_url
  end
end
