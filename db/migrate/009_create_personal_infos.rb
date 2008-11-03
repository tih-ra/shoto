class CreatePersonalInfos < ActiveRecord::Migration
  def self.up
    create_table :personal_infos do |t|
      t.column :content, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :personal_infos
  end
end
