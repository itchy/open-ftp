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

ActiveRecord::Schema.define(:version => 20110813072346) do

  create_table "box_files", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "file_id"
    t.string   "url_code"
    t.integer  "watched",        :default => 1
    t.integer  "notify",         :default => 1
    t.integer  "download_count"
    t.integer  "max_downloads"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "download_codes", :force => true do |t|
    t.integer  "box_file_id"
    t.string   "code"
    t.integer  "download_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "sms_number"
    t.string   "password_digest"
    t.integer  "active",          :default => 0
    t.string   "box_auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
