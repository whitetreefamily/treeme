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

ActiveRecord::Schema.define(version: 20160413190754) do

  create_table "admins", force: :cascade do |t|
    t.boolean  "check",         default: false
    t.integer  "user_id"
    t.string   "username"
    t.string   "password"
    t.string   "password_hash"
    t.string   "users"
    t.string   "password_salt"
    t.string   "position"
    t.boolean  "change",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "page_id"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "views"
    t.string   "slug"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug"

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "branches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "check",      default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "categories_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestant_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contestant_id"
    t.integer  "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "vote_page_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.string   "name"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "vote_page_id"
  end

  create_table "infos", force: :cascade do |t|
    t.integer  "page_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.integer  "page_no"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "views"
    t.text     "body"
    t.string   "slug"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.string   "password_hash"
    t.string   "users"
    t.string   "password_salt"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image"
    t.string   "sex"
    t.boolean  "admin",                  default: false
    t.text     "bio"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "auth_token"
    t.date     "birthday"
    t.boolean  "change",                 default: false
  end

  create_table "vote_pages", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "page_id"
  end

end
