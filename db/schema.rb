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

ActiveRecord::Schema.define(version: 20210710084305) do

  create_table "daily_menus", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "recipe_id",      null: false
    t.integer  "weekly_menu_id", null: false
    t.text     "memo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "unit",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id",     null: false
    t.integer  "ingredient_id", null: false
    t.float    "quantity",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "genre_id",   null: false
    t.string   "name",       null: false
    t.text     "step",       null: false
    t.string   "image_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weekly_menus", force: :cascade do |t|
    t.datetime "activated_at",   null: false
    t.datetime "inactivated_at", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
