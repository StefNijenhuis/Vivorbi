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

ActiveRecord::Schema.define(version: 20131126123219) do

  create_table "comments", force: true do |t|
    t.integer "user_id"
    t.integer "message_id"
    t.text    "body"
  end

  add_index "comments", ["message_id"], name: "index_comments_on_message_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "messages", force: true do |t|
    t.integer "user_id"
    t.string  "title"
    t.text    "body"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "users", force: true do |t|
    t.string "name"
    t.string "postal_code"
    t.float  "latitude",    limit: 10
    t.float  "longitude",   limit: 10
  end

end
