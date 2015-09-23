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

ActiveRecord::Schema.define(version: 20150923082552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "category"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "good_counters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "good_counters", ["user_id"], name: "index_good_counters_on_user_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.date     "daily_date"
    t.text     "body"
    t.boolean  "public"
    t.text     "confidentiality"
    t.string   "rank"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "timereports", force: :cascade do |t|
    t.time     "time_from"
    t.time     "time_to"
    t.string   "occupation"
    t.string   "remark"
    t.integer  "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "timereports", ["report_id"], name: "index_timereports_on_report_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "first_name_kana"
    t.string   "last_name_kana"
    t.string   "picture"
    t.integer  "role"
    t.boolean  "send_mail"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "articles", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "good_counters", "users"
  add_foreign_key "notices", "users"
  add_foreign_key "reports", "users"
  add_foreign_key "timereports", "reports"
end
