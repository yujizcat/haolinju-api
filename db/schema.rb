# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_02_105836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "owner_item_id", null: false
    t.bigint "taker_item_id", null: false
    t.string "status"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_item_id"], name: "index_bids_on_owner_item_id"
    t.index ["taker_item_id"], name: "index_bids_on_taker_item_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "compounds", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "category"
    t.string "description"
    t.string "condition"
    t.string "image_url"
    t.integer "value"
    t.string "request"
    t.string "freebie"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bid_id", null: false
    t.string "comment"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bid_id"], name: "index_reviews_on_bid_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.string "last_name"
    t.integer "is_banned"
    t.integer "score"
    t.integer "building_number"
    t.integer "room_number"
    t.bigint "compound_id", null: false
    t.index ["compound_id"], name: "index_users_on_compound_id"
  end

  add_foreign_key "bids", "users"
  add_foreign_key "items", "users"
  add_foreign_key "reviews", "bids"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "compounds"
end
