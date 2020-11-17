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

ActiveRecord::Schema.define(version: 2020_11_17_014535) do

  create_table "budgets", force: :cascade do |t|
    t.string "expected_income"
    t.integer "expected_income_amount"
    t.integer "actual_income_amount"
    t.integer "actual_diff"
    t.integer "lives_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lives_id"], name: "index_budgets_on_lives_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "lives_id"
    t.string "create_goal"
    t.date "start_date"
    t.date "end_date"
    t.boolean "achieved"
    t.text "note_goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lives_id"], name: "index_goals_on_lives_id"
  end

  create_table "lives", force: :cascade do |t|
    t.string "life_category"
    t.string "life_name"
    t.string "life_activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
