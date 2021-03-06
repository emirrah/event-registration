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

ActiveRecord::Schema.define(version: 20140714061410) do

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_name"
    t.integer  "num_of_tables"
    t.integer  "max_seats"
    t.date     "date"
  end

  create_table "guests", force: true do |t|
    t.integer  "table_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_of_seats"
    t.string   "name"
  end

  add_index "guests", ["event_id"], name: "index_guests_on_event_id"
  add_index "guests", ["table_id"], name: "index_guests_on_table_id"

  create_table "seats", force: true do |t|
    t.boolean  "occupied"
    t.integer  "table_id"
    t.integer  "guest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seats", ["guest_id"], name: "index_seats_on_guest_id"
  add_index "seats", ["table_id"], name: "index_seats_on_table_id"

  create_table "tables", force: true do |t|
    t.integer  "max_seats"
    t.string   "table_number"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tables", ["event_id"], name: "index_tables_on_event_id"

end
