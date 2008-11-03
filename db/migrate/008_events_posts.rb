class EventsPosts < ActiveRecord::Migration
  def self.up
    create_table :events_posts, :id => false do |t|
      t.column :event_id, :integer
      t.column :post_id, :integer
    end
    
    add_index :events_posts, [:event_id]
    add_index :events_posts, [:post_id]
  end

  def self.down
    drop_table :events_posts
  end
end
