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

ActiveRecord::Schema.define(version: 20160307220925) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "pantry_item_categories", force: :cascade do |t|
    t.integer "pantry_item_id"
    t.integer "category_id"
  end

  create_table "pantry_item_ingredients", force: :cascade do |t|
    t.integer "pantry_item_id"
    t.integer "ingredient_id"
    t.string  "measurement"
    t.integer "quantity"
  end

  create_table "pantry_items", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "quantity"
    t.integer "user_id"
    t.boolean "show_public", default: true
    t.string  "portion"
    t.string  "days_to_exp"
  end

  create_table "pantry_items_user_logs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pantry_item_id"
    t.string  "action"
    t.integer "quantity"
  end

  create_table "pantry_items_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pantry_item_id"
    t.integer "quantity"
    t.string  "exp_date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "password_digest"
    t.string   "api_token"
    t.boolean  "exp_notif",       default: true
    t.integer  "exp_soon_days",   default: 14
  end

end
