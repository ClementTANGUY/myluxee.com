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

ActiveRecord::Schema.define(version: 20151108153550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "website"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.string   "monday_start"
    t.string   "monday_end"
    t.string   "tuesday_start"
    t.string   "tuesday_end"
    t.string   "wednesday_start"
    t.string   "wednesday_end"
    t.string   "thursday_start"
    t.string   "thursday_end"
    t.string   "friday_start"
    t.string   "friday_end"
    t.string   "saturday_start"
    t.string   "saturday_end"
    t.string   "sunday_start"
    t.string   "sunday_end"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "grader_id"
    t.integer  "graded_id"
    t.integer  "welcome_score"
    t.integer  "appearance_score"
    t.integer  "knowledge_score"
    t.integer  "listening_score"
    t.integer  "global_score"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sales_associate_languages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sales_associate_news", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_brands", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_news", force: :cascade do |t|
    t.integer  "store_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "country"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.string   "monday_start"
    t.string   "monday_end"
    t.string   "tuesday_start"
    t.string   "tuesday_end"
    t.string   "wednesday_start"
    t.string   "wednesday_end"
    t.string   "thursday_start"
    t.string   "thursday_end"
    t.string   "friday_start"
    t.string   "friday_end"
    t.string   "saturday_start"
    t.string   "saturday_end"
    t.string   "sunday_start"
    t.string   "sunday_end"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "be_contacted"
    t.boolean  "be_rated"
    t.string   "contact_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  add_foreign_key "positions", "stores"
  add_foreign_key "positions", "users"
  add_foreign_key "ratings", "users", column: "graded_id"
  add_foreign_key "ratings", "users", column: "grader_id"
  add_foreign_key "sales_associate_languages", "languages"
  add_foreign_key "sales_associate_languages", "users"
  add_foreign_key "sales_associate_news", "users"
  add_foreign_key "store_brands", "brands"
  add_foreign_key "store_brands", "stores"
  add_foreign_key "store_news", "stores"
end
