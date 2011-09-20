# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110920024404) do

  create_table "abouts", :force => true do |t|
    t.integer  "user_id"
    t.string   "type",         :default => ""
    t.string   "moto",         :default => ""
    t.string   "occupation",   :default => ""
    t.string   "home_town",    :default => ""
    t.string   "current_town", :default => ""
    t.string   "gender",       :default => ""
    t.string   "relationship", :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "albums", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "albums", ["photo_content_type"], :name => "album_contentType"
  add_index "albums", ["photo_file_name"], :name => "album_fileName"
  add_index "albums", ["photo_file_size"], :name => "album_fileSize"
  add_index "albums", ["user_id"], :name => "album_user"

  create_table "authenticates", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.string   "web_name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  add_index "bookmarks", ["url"], :name => "bookmark_url"
  add_index "bookmarks", ["user_id"], :name => "bookmark_user"
  add_index "bookmarks", ["web_name"], :name => "bookmark_web_name"

  create_table "locations", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "address"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recip_id"
    t.string   "subject"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recip_id"], :name => "message_recip"
  add_index "messages", ["user_id"], :name => "message_user"

  create_table "order_transactions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "album_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "photos", ["album_id"], :name => "photo_album"
  add_index "photos", ["picture_content_type"], :name => "photo_contentType"
  add_index "photos", ["picture_file_name"], :name => "photo_fileName"
  add_index "photos", ["picture_file_size"], :name => "photo_fileSize"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["avatar_content_type"], :name => "profiel_contentType"
  add_index "profiles", ["avatar_file_name"], :name => "profile_fileName"
  add_index "profiles", ["avatar_file_size"], :name => "profile_fileSize"
  add_index "profiles", ["user_id"], :name => "profile_user"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "rel_followed"
  add_index "relationships", ["follower_id"], :name => "rel_followers"

  create_table "responses", :force => true do |t|
    t.integer  "message_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "responses", ["message_id"], :name => "response_message"
  add_index "responses", ["user_id"], :name => "response_user"

  create_table "statuses", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storages", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "storeaccounts", :force => true do |t|
    t.string   "ip_address"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "storeplan_id"
  end

  create_table "storeplans", :force => true do |t|
    t.integer  "user_id"
    t.integer  "plan"
    t.string   "plan_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_price"
    t.integer  "limit"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",              :default => false
    t.string   "password_rem_token"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "users", ["id"], :name => "user_id_index"

end
