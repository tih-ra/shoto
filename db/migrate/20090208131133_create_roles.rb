class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name, :ident
      
      t.timestamps
    end
    
    create_table :roles_users, :id => false do |t|
      t.column :user_id, :integer
      t.column :role_id, :integer
    end
    
    add_index :roles_users, [:user_id]
    add_index :roles_users, [:role_id]    
    
    Role.create(:name => "Admin", :ident => 'admin')
    Role.create(:name => "Moderator", :ident => 'moderator')
    Role.create(:name => "Editor", :ident => 'editor')
    Role.create(:name => "Producer", :ident => 'producer')
    Role.create(:name => "Partner", :ident => 'partner')
  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end
end
