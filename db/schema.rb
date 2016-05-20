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

ActiveRecord::Schema.define(version: 20160520090501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "status"
    t.integer  "final_price"
    t.integer  "facility_id"
    t.integer  "job_request_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "bookings", ["facility_id"], name: "index_bookings_on_facility_id", using: :btree
  add_index "bookings", ["job_request_id"], name: "index_bookings_on_job_request_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.string   "siret"
    t.date     "creation_date"
    t.string   "address"
    t.string   "size"
    t.string   "category"
    t.string   "website_url"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "photo"
  end

  add_index "facilities", ["user_id"], name: "index_facilities_on_user_id", using: :btree

  create_table "job_requests", force: :cascade do |t|
    t.integer  "staff_size"
    t.string   "position"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "max_price"
    t.integer  "facility_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "location"
  end

  add_index "job_requests", ["facility_id"], name: "index_job_requests_on_facility_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "birth_place"
    t.text     "description"
    t.string   ""
    t.integer  "min_wage"
    t.string   "address"
    t.integer  "mobility_radius"
    t.boolean  "on_duty"
    t.string   "social_security_number"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "telephone"
    t.string   "photo"
    t.text     "availability"
    t.boolean  "owner",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "facilities"
  add_foreign_key "bookings", "job_requests"
  add_foreign_key "bookings", "users"
  add_foreign_key "facilities", "users"
  add_foreign_key "job_requests", "facilities"
end
