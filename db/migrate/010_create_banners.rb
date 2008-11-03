class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.column :title, :string
      t.column :content, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
