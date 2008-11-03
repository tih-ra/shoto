class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.string :title, :slug
      t.text :content
      t.boolean :is_public, :default=>true
      t.timestamps 
    end
  end

  def self.down
    drop_table :posts
  end
end
