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

ActiveRecord::Schema.define(version: 20140612173155) do

  create_table "admins", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name"

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.string   "author"
    t.string   "author_website"
    t.text     "body"
    t.datetime "posted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "posts", force: true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "body"
    t.date     "posted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true
  add_index "posts", ["title"], name: "index_posts_on_title"

  create_table "posts_tags", id: false, force: true do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", unique: true

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name"

end
