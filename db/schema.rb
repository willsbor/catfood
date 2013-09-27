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

ActiveRecord::Schema.define(version: 20130927070908) do

  create_table "capacities", force: true do |t|
    t.float    "amount"
    t.string   "unit"
    t.integer  "sub_capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_logs", force: true do |t|
    t.integer  "price"
    t.date     "log_date"
    t.integer  "product_info_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "capacity_id"
  end

  add_index "price_logs", ["user_id"], name: "index_price_logs_on_user_id"

  create_table "product_info_capacityships", force: true do |t|
    t.integer  "product_info_id"
    t.integer  "capacity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_info_locationships", force: true do |t|
    t.integer  "product_info_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_infos", force: true do |t|
    t.string   "vendor"
    t.text     "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_log_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["price_log_id"], name: "index_users_on_price_log_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
