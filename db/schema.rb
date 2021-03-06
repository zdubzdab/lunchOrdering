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

ActiveRecord::Schema.define(version: 20150827134904) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "days", force: :cascade do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "days", ["user_id"], name: "index_days_on_user_id"

  create_table "drink_items", force: :cascade do |t|
    t.integer  "drink_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "drink_items", ["cart_id"], name: "index_drink_items_on_cart_id"
  add_index "drink_items", ["drink_id"], name: "index_drink_items_on_drink_id"
  add_index "drink_items", ["order_id"], name: "index_drink_items_on_order_id"

  create_table "drinks", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "day_id"
  end

  add_index "drinks", ["day_id"], name: "index_drinks_on_day_id"

  create_table "first_courses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "day_id"
  end

  add_index "first_courses", ["day_id"], name: "index_first_courses_on_day_id"

  create_table "first_items", force: :cascade do |t|
    t.integer  "first_course_id"
    t.integer  "cart_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order_id"
  end

  add_index "first_items", ["cart_id"], name: "index_first_items_on_cart_id"
  add_index "first_items", ["first_course_id"], name: "index_first_items_on_first_course_id"
  add_index "first_items", ["order_id"], name: "index_first_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["day_id"], name: "index_orders_on_day_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "second_courses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "day_id"
  end

  add_index "second_courses", ["day_id"], name: "index_second_courses_on_day_id"

  create_table "second_items", force: :cascade do |t|
    t.integer  "second_course_id"
    t.integer  "cart_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "order_id"
  end

  add_index "second_items", ["cart_id"], name: "index_second_items_on_cart_id"
  add_index "second_items", ["order_id"], name: "index_second_items_on_order_id"
  add_index "second_items", ["second_course_id"], name: "index_second_items_on_second_course_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
