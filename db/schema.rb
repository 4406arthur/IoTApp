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

ActiveRecord::Schema.define(version: 20141223084014) do

  create_table "devices", force: true do |t|
    t.integer  "plant_wall_id"
    t.string   "name"
    t.string   "category"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "harvest_points", force: true do |t|
    t.integer  "plant_wall_id"
    t.string   "breed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  create_table "plant_walls", force: true do |t|
    t.integer  "swot_user_id"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sense_values", force: true do |t|
    t.integer  "device_id"
    t.float    "data",        limit: 24
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: true do |t|
    t.integer  "plant_wall_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suggestions", ["plant_wall_id", "created_at"], name: "index_suggestions_on_plant_wall_id_and_created_at", using: :btree

  create_table "swot_users", primary_key: "gw_id", force: true do |t|
    t.integer  "fb_id",      limit: 8, null: false
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
