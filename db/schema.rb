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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140430162413) do

  create_table "bookings", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "length"
    t.integer  "user_id"
    t.integer  "student_id"
  end

  add_index "bookings", ["student_id"], name: "index_bookings_on_student_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "conversations", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages_topics", force: true do |t|
    t.integer  "topic_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.integer  "booking_id"
  end

  create_table "messages", force: true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.boolean  "deleted"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "english"
    t.boolean  "french"
    t.boolean  "spanish"
  end

  create_table "user_infos", force: true do |t|
    t.integer  "user_id"
    t.integer  "exp_pts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "dob"
    t.integer  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "native_lang"
    t.string   "first_lang"
    t.string   "second_lang"
    t.integer  "first_lang_lvl",       default: 1
    t.integer  "second_lang_lvl",      default: 1
    t.string   "location"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
