class AddCryticalDateToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :crytical_date, :date
  end

  def self.down
    remove_column :projects, :crytical_date
  end
end
