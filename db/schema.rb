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

ActiveRecord::Schema.define(version: 20161026104203) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.string   "author"
    t.string   "img_path"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "books", ["slug"], name: "index_books_on_slug", unique: true

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.string   "slug"
    t.integer  "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true

  create_table "categories_books", force: :cascade do |t|
    t.integer "book_id"
    t.integer "category_id"
  end

  create_table "categories_posts", force: :cascade do |t|
    t.integer "post_id"
    t.integer "category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.string   "img_preview"
    t.string   "embed_link"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name"
    t.string   "slug"
    t.integer  "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["slug"], name: "index_tags_on_slug", unique: true

  create_table "tags_books", force: :cascade do |t|
    t.integer "book_id"
    t.integer "tag_id"
  end

  create_table "tags_posts", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "email"
    t.string   "fullname"
    t.string   "address"
    t.integer  "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
