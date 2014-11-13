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

ActiveRecord::Schema.define(version: 20141031055408) do

  create_table "allergen_components", force: true do |t|
    t.integer  "allergen_warning_id"
    t.integer  "component_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "allergen_components", ["allergen_warning_id"], name: "index_allergen_components_on_allergen_warning_id"
  add_index "allergen_components", ["component_id"], name: "index_allergen_components_on_component_id"

  create_table "allergen_warnings", force: true do |t|
    t.string   "warning_content"
    t.string   "warning_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", force: true do |t|
    t.integer  "meal_id"
    t.integer  "person_id"
    t.boolean  "going"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["meal_id"], name: "index_attendances_on_meal_id"
  add_index "attendances", ["person_id"], name: "index_attendances_on_person_id"

  create_table "bug_reports", force: true do |t|
    t.string   "platform"
    t.string   "report"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_meals", force: true do |t|
    t.integer "meal_id"
    t.integer "component_id"
  end

  create_table "feedback_for_meals", force: true do |t|
    t.integer  "meal_id"
    t.string   "person_belongs_to"
    t.text     "body"
    t.datetime "date_of_meal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedback_for_meals", ["meal_id"], name: "index_feedback_for_meals_on_meal_id"

  create_table "indication_for_meals", force: true do |t|
    t.integer  "component_id"
    t.integer  "attendance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "indication_for_meals", ["attendance_id"], name: "index_indication_for_meals_on_attendance_id"
  add_index "indication_for_meals", ["component_id"], name: "index_indication_for_meals_on_component_id"

  create_table "meals", force: true do |t|
    t.datetime "date_and_time_of_meal"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.boolean  "still_active"
    t.boolean  "staff"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
