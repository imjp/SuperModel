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

ActiveRecord::Schema.define(:version => 20110724010105) do

  create_table "portfolios", :force => true do |t|
    t.integer  "height"
    t.string   "bust"
    t.integer  "waist"
    t.integer  "hips"
    t.integer  "shoes"
    t.string   "eyes"
    t.string   "hair"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "suit"
    t.integer  "inseam"
  end

  add_index "portfolios", ["user_id"], :name => "index_portfolios_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "sex"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.string   "photo_1"
    t.string   "photo_2"
    t.string   "photo_3"
    t.string   "gender"
    t.string   "photo_1_file_name"
    t.string   "photo_1_content_type"
    t.integer  "photo_1_file_size"
    t.datetime "photo_1_updated_at"
  end

end
