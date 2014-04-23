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

ActiveRecord::Schema.define(version: 20140423141403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "articles", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "brief"
    t.text     "content"
    t.boolean  "published"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "image_files", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "file_fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_files", ["imageable_id", "imageable_type"], name: "index_image_files_on_imageable_id_and_imageable_type", using: :btree

  create_table "products", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "brief"
    t.text     "descr"
    t.hstore   "properties"
    t.integer  "price"
    t.integer  "stock"
    t.boolean  "public"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "products_tags", force: true do |t|
    t.integer "product_id"
    t.integer "tag_id"
  end

  add_index "products_tags", ["product_id"], name: "index_products_tags_on_product_id", using: :btree
  add_index "products_tags", ["tag_id"], name: "index_products_tags_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
