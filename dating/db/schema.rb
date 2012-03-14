# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120314041248) do

  create_table "interests", :force => true do |t|
    t.integer  "interest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.boolean  "read"
    t.string   "msg_type"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "relationships", ["match_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["user_id", "match_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["user_id"], :name => "index_relationships_on_follower_id"

  create_table "timeline_updates", :force => true do |t|
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "timeline_updates", ["user_id"], :name => "index_timeline_updates_on_user_id"

  create_table "user_infos", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.date     "dob"
    t.string   "location"
    t.string   "gender"
    t.string   "interested_in"
    t.string   "looking_for"
    t.string   "about"
    t.string   "status"
    t.datetime "last_visit"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "user_infos", ["user_id"], :name => "index_user_infos_on_user_id"

  create_table "user_interests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_interests", ["interest_id"], :name => "index_user_interests_on_interest_id"
  add_index "user_interests", ["user_id"], :name => "index_user_interests_on_user_id"

  create_table "users", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "dob"
    t.string   "gender"
    t.string   "location"
    t.string   "about"
  end

end
