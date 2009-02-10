# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090210024240) do

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_freeze_frames", :default => false
  end

  create_table "assets", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "type"
    t.integer  "user_id"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avatars", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.datetime "created_at",                                     :null => false
    t.integer  "commentable_id",                 :default => 0,  :null => false
    t.string   "commentable_type", :limit => 15, :default => "", :null => false
    t.integer  "user_id",                        :default => 0,  :null => false
  end

  add_index "comments", ["user_id"], :name => "fk_comments_user"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "geography"
    t.string   "place"
    t.datetime "start_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "info_url"
  end

  create_table "events_posts", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "post_id"
  end

  add_index "events_posts", ["event_id"], :name => "index_events_posts_on_event_id"
  add_index "events_posts", ["post_id"], :name => "index_events_posts_on_post_id"

  create_table "personal_infos", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_attachments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "attachable_id"
    t.text     "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.boolean  "is_public",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_top",         :default => false
    t.boolean  "is_video",       :default => false
    t.integer  "comment_status", :default => 0
    t.integer  "access_level",   :default => 0
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "color"
    t.date     "start_at"
    t.date     "finish_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "crytical_date"
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "projects_users", ["project_id"], :name => "index_projects_users_on_project_id"
  add_index "projects_users", ["user_id"], :name => "index_projects_users_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "ident"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "services", :force => true do |t|
    t.integer  "category"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.string   "mobilephone"
    t.string   "homephone"
    t.string   "messanger"
  end

end
