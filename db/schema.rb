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

ActiveRecord::Schema.define(version: 2020_03_22_133530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boardgames", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "age"
    t.integer "players_min"
    t.integer "players_max"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boardgames_on_user_id"
  end

  create_table "gamenights", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.text "description"
    t.bigint "location_id"
    t.bigint "boardgame_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["boardgame_id"], name: "index_gamenights_on_boardgame_id"
    t.index ["location_id"], name: "index_gamenights_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "user_id"
    t.bigint "gamenight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gamenight_id"], name: "index_participations_on_gamenight_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.text "presentation"
    t.float "global_rating"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boardgames", "users"
  add_foreign_key "gamenights", "boardgames"
  add_foreign_key "gamenights", "locations"
  add_foreign_key "locations", "users"
  add_foreign_key "participations", "gamenights"
  add_foreign_key "participations", "users"
end
