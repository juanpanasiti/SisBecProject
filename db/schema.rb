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

ActiveRecord::Schema.define(version: 20160427210331) do

  create_table "document_files", force: :cascade do |t|
    t.integer  "personal_datum_id"
    t.string   "file_name"
    t.string   "extension"
    t.string   "document_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "document_files", ["personal_datum_id"], name: "index_document_files_on_personal_datum_id"

  create_table "economic_situations", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "dwelling"
    t.integer  "rent"
    t.string   "situation"
    t.decimal  "incomes"
    t.integer  "vehicles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "economic_situations", ["profile_id"], name: "index_economic_situations_on_profile_id"

  create_table "family_situations", force: :cascade do |t|
    t.integer  "personal_datum_id"
    t.integer  "children"
    t.integer  "dependents"
    t.integer  "minors"
    t.string   "disability"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "family_situations", ["personal_datum_id"], name: "index_family_situations_on_personal_datum_id"

  create_table "kind_of_scholarships", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "short_description"
    t.string   "state"
    t.datetime "starting_date"
    t.datetime "ending_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "personal_data", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "lastname"
    t.string   "document"
    t.datetime "birthdate"
    t.string   "address"
    t.string   "city"
    t.string   "phone"
    t.string   "cellphone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "personal_data", ["profile_id"], name: "index_personal_data_on_profile_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "check_ok"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "relatives", force: :cascade do |t|
    t.integer  "family_situation_id"
    t.string   "name"
    t.string   "lastname"
    t.string   "document"
    t.string   "relationship"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "relatives", ["family_situation_id"], name: "index_relatives_on_family_situation_id"

  create_table "scholarship_requests", force: :cascade do |t|
    t.integer  "school_situation_id"
    t.integer  "kind_of_scholarship_id"
    t.string   "state"
    t.string   "message"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "scholarship_requests", ["kind_of_scholarship_id"], name: "index_scholarship_requests_on_kind_of_scholarship_id"
  add_index "scholarship_requests", ["school_situation_id"], name: "index_scholarship_requests_on_school_situation_id"

  create_table "school_situations", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "career"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "school_situations", ["profile_id"], name: "index_school_situations_on_profile_id"

  create_table "school_weeks", force: :cascade do |t|
    t.integer  "school_situation_id"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "school_weeks", ["school_situation_id"], name: "index_school_weeks_on_school_situation_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "access_level",                        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
