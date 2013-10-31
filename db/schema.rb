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

ActiveRecord::Schema.define(version: 20131030110256) do

  create_table "requests", force: true do |t|
    t.string   "title"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "in_between"
    t.string   "last_name"
    t.string   "street"
    t.string   "house_number"
    t.string   "postal_code"
    t.string   "place"
    t.date     "date_of_birth"
    t.string   "cellphone"
    t.string   "phone"
    t.string   "email"
    t.text     "hobbies"
    t.boolean  "has_avatar"
  end

end
