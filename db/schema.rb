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

ActiveRecord::Schema.define(version: 20140703095504) do

  create_table "devices", id: false, force: true do |t|
    t.integer  "device_id",              default: 0, null: false
    t.integer  "swot_user_id", limit: 8, default: 0, null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["swot_user_id", "device_id"], name: "index_devices_on_swot_user_id_and_device_id", unique: true, using: :btree

  create_table "sense_values", force: true do |t|
    t.float    "data"
    t.integer  "device_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: true do |t|
    t.string   "content"
    t.integer  "swot_user_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suggestions", ["swot_user_id", "created_at"], name: "index_suggestions_on_swot_user_id_and_created_at", using: :btree

  create_table "swot_users", primary_key: "fb_id", force: true do |t|
    t.integer  "gw_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
