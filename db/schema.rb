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

ActiveRecord::Schema.define(version: 2018_06_14_095322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "bank_name"
    t.string "iban"
    t.string "account_holder"
    t.string "BIC"
    t.string "bank_address"
    t.integer "cook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.bigint "meal_id"
    t.integer "status"
    t.integer "doses"
    t.integer "item_price_cents", default: 0, null: false
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "meal_sku"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.boolean "purchased", default: false, null: false
    t.index ["meal_id"], name: "index_items_on_meal_id"
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "grams_per_dose"
    t.text "ingredients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.integer "cook_id"
    t.string "sku"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.datetime "start_time"
    t.index ["cook_id"], name: "index_meals_on_cook_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status", default: 0
    t.integer "total_price_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sku"
    t.jsonb "payment"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "user_id"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_reviews_on_meal_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "address"
    t.integer "cook_status", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "photo_fake"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "week_days", force: :cascade do |t|
    t.bigint "meal_id"
    t.datetime "pick_up_time_start"
    t.datetime "pick_up_time_end"
    t.datetime "last_order_time"
    t.integer "doses"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["meal_id"], name: "index_week_days_on_meal_id"
  end

  add_foreign_key "items", "meals"
  add_foreign_key "items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "meals"
  add_foreign_key "reviews", "users"
  add_foreign_key "week_days", "meals"
end
