class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :category
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
