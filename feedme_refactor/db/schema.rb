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

ActiveRecord::Schema.define(version: 20150425203634) do

  create_table "attendances", force: true do |t|
    t.integer  "meal_id"
    t.integer  "person_id"
    t.boolean  "going"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["meal_id"], name: "index_attendances_on_meal_id"
  add_index "attendances", ["person_id"], name: "index_attendances_on_person_id"

  create_table "component_meals", force: true do |t|
    t.integer "meal_id"
    t.integer "component_id"
  end

  add_index "component_meals", ["component_id"], name: "index_component_meals_on_component_id"
  add_index "component_meals", ["meal_id"], name: "index_component_meals_on_meal_id"

  create_table "components", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indications", force: true do |t|
    t.integer  "component_id"
    t.integer  "attendance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "indications", ["attendance_id"], name: "index_indications_on_attendance_id"
  add_index "indications", ["component_id"], name: "index_indications_on_component_id"

  create_table "meals", force: true do |t|
    t.datetime "date_and_time"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "staff"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
