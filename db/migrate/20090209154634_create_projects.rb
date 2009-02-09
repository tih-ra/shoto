class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.string :color
      t.date :start_at
      t.date :finish_at
      t.text :description
      t.timestamps
    end
    
    create_table :projects_users, :id => false do |t|
      t.column :user_id, :integer
      t.column :project_id, :integer
    end
    
    add_index :projects_users, [:user_id]
    add_index :projects_users, [:project_id]
    
  end

  def self.down
    drop_table :projects
  end
end
