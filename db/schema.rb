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

ActiveRecord::Schema.define(version: 20171113022006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blesses", force: :cascade do |t|
    t.text     "blessing"
    t.integer  "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_blesses_on_week_id", using: :btree
  end

  create_table "creative_responses", force: :cascade do |t|
    t.text     "response"
    t.integer  "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_creative_responses_on_week_id", using: :btree
  end

  create_table "days", force: :cascade do |t|
    t.datetime "date"
    t.string   "day_of_week"
    t.string   "verse"
    t.string   "title"
    t.integer  "reading_list_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["reading_list_id"], name: "index_days_on_reading_list_id", using: :btree
  end

  create_table "faith5s", force: :cascade do |t|
    t.text     "share"
    t.text     "talk"
    t.text     "pray"
    t.text     "bless"
    t.text     "read"
    t.integer  "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_faith5s_on_week_id", using: :btree
  end

  create_table "mealtime_prayers", force: :cascade do |t|
    t.text     "mealtime_prayer"
    t.integer  "week_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["week_id"], name: "index_mealtime_prayers_on_week_id", using: :btree
  end

  create_table "memory_verses", force: :cascade do |t|
    t.text     "text"
    t.string   "verse_address"
    t.integer  "week_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["week_id"], name: "index_memory_verses_on_week_id", using: :btree
  end

  create_table "prays", force: :cascade do |t|
    t.text     "prayer"
    t.integer  "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_prays_on_week_id", using: :btree
  end

  create_table "reading_lists", force: :cascade do |t|
    t.datetime "day"
    t.integer  "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "verse"
    t.string   "title"
    t.index ["week_id"], name: "index_reading_lists_on_week_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "church_season"
    t.text     "description"
    t.integer  "week_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["week_id"], name: "index_seasons_on_week_id", using: :btree
  end

  create_table "service_ideas", force: :cascade do |t|
    t.text     "idea"
    t.integer  "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_service_ideas_on_week_id", using: :btree
  end

  create_table "shares", force: :cascade do |t|
    t.text     "questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "week_id"
    t.index ["week_id"], name: "index_shares_on_week_id", using: :btree
  end

  create_table "talks", force: :cascade do |t|
    t.text     "question"
    t.integer  "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_talks_on_week_id", using: :btree
  end

  create_table "weeks", force: :cascade do |t|
    t.string   "name"
    t.datetime "published_on"
    t.datetime "archived_on"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "season"
    t.boolean  "queued",       default: false
    t.boolean  "published",    default: false
    t.integer  "season_id"
    t.index ["season_id"], name: "index_weeks_on_season_id", using: :btree
  end

  add_foreign_key "blesses", "weeks"
  add_foreign_key "creative_responses", "weeks"
  add_foreign_key "days", "reading_lists"
  add_foreign_key "faith5s", "weeks"
  add_foreign_key "mealtime_prayers", "weeks"
  add_foreign_key "memory_verses", "weeks"
  add_foreign_key "prays", "weeks"
  add_foreign_key "reading_lists", "weeks"
  add_foreign_key "seasons", "weeks"
  add_foreign_key "service_ideas", "weeks"
  add_foreign_key "shares", "weeks"
  add_foreign_key "talks", "weeks"
  add_foreign_key "weeks", "seasons"
end
