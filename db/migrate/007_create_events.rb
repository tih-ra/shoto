class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.column :title, :string
      t.column :geography, :string
      t.column :place, :string
      t.column :start_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
