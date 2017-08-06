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

ActiveRecord::Schema.define(version: 20170806111131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.integer  "seat"
    t.string   "color"
    t.integer  "price"
    t.integer  "public_year"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "activate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "message_threads", force: :cascade do |t|
    t.integer  "started_user_id"
    t.integer  "to_user_id"
    t.integer  "latest_message_id"
    t.string   "subject"
    t.boolean  "is_deleted"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "message_threads", ["latest_message_id"], name: "index_message_threads_on_latest_message_id", using: :btree
  add_index "message_threads", ["started_user_id"], name: "index_message_threads_on_started_user_id", using: :btree
  add_index "message_threads", ["to_user_id"], name: "index_message_threads_on_to_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",         null: false
    t.integer  "receiver_id",       null: false
    t.text     "body"
    t.boolean  "is_sender_read"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "message_thread_id"
    t.boolean  "is_receiver_read"
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string    "email",                                                                              default: "", null: false
    t.string    "encrypted_password",                                                                 default: "", null: false
    t.string    "reset_password_token"
    t.datetime  "reset_password_sent_at"
    t.datetime  "remember_created_at"
    t.integer   "sign_in_count",                                                                      default: 0,  null: false
    t.datetime  "current_sign_in_at"
    t.datetime  "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.datetime  "created_at",                                                                                      null: false
    t.datetime  "updated_at",                                                                                      null: false
    t.string    "first_name"
    t.string    "last_name"
    t.string    "city"
    t.string    "address"
    t.string    "phone_number"
    t.geography "coordinates",            limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "message_threads", "messages", column: "latest_message_id"
  add_foreign_key "message_threads", "users", column: "started_user_id"
  add_foreign_key "message_threads", "users", column: "to_user_id"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
end
