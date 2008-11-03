class CreatePostAttachments < ActiveRecord::Migration
  def self.up
    create_table :post_attachments do |t|
      t.column :post_id, :integer
      t.column :attachable_id, :integer
      t.column :attachable_type, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :post_attachments
  end
end
