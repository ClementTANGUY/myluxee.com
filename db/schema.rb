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

ActiveRecord::Schema.define(version: 20151009115001) do

  create_table "brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "speciality", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "store_id",           limit: 4
    t.integer  "sales_associate_id", limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "role",               limit: 255
  end

  add_index "positions", ["sales_associate_id"], name: "fk_rails_f980d9ac18", using: :btree
  add_index "positions", ["store_id"], name: "fk_rails_b240de51d6", using: :btree

  create_table "sales_associate_languages", force: :cascade do |t|
    t.integer  "sales_associate_id", limit: 4
    t.integer  "language_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "sales_associate_languages", ["language_id"], name: "fk_rails_338d15adeb", using: :btree
  add_index "sales_associate_languages", ["sales_associate_id"], name: "fk_rails_81e559954e", using: :btree

  create_table "sales_associate_news", force: :cascade do |t|
    t.integer  "sales_associate_id", limit: 4
    t.text     "content",            limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "sales_associate_news", ["sales_associate_id"], name: "fk_rails_9deb747e12", using: :btree

  create_table "sales_associates", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.boolean  "be_contacted"
    t.boolean  "be_rated"
    t.string   "contact_email",          limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "sales_associates", ["email"], name: "index_sales_associates_on_email", unique: true, using: :btree
  add_index "sales_associates", ["reset_password_token"], name: "index_sales_associates_on_reset_password_token", unique: true, using: :btree

  create_table "store_brands", force: :cascade do |t|
    t.integer  "brand_id",   limit: 4
    t.integer  "store_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "store_brands", ["brand_id"], name: "fk_rails_6948145657", using: :btree
  add_index "store_brands", ["store_id"], name: "fk_rails_632e340a75", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "address",         limit: 255
    t.string   "state",           limit: 255
    t.string   "city",            limit: 255
    t.integer  "zip_code",        limit: 4
    t.string   "country",         limit: 255
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.time     "monday_start"
    t.time     "monday_end"
    t.time     "tuesday_start"
    t.time     "tuesday_end"
    t.time     "wednesday_start"
    t.time     "wednesday_end"
    t.time     "thursday_start"
    t.time     "thursday_end"
    t.time     "friday_start"
    t.time     "friday_end"
    t.time     "saturday_start"
    t.time     "saturday_end"
    t.time     "sunday_start"
    t.time     "sunday_end"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "positions", "sales_associates"
  add_foreign_key "positions", "stores"
  add_foreign_key "sales_associate_languages", "languages"
  add_foreign_key "sales_associate_languages", "sales_associates"
  add_foreign_key "sales_associate_news", "sales_associates"
  add_foreign_key "store_brands", "brands"
  add_foreign_key "store_brands", "stores"
end
