class AddPersonalContactsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :birthdate, :date
    add_column :users, :mobilephone, :string
    add_column :users, :homephone, :string
    add_column :users, :messanger, :string
  end

  def self.down
    remove_column :users, :messanger
    remove_column :users, :homephone
    remove_column :users, :mobilephone
    remove_column :users, :birthdate
  end
end
