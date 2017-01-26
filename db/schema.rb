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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140110195413) do

  create_table "assets", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "program_id"
  end

  create_table "attachments", :force => true do |t|
    t.string   "file"
    t.integer  "attachable_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "attachable_type"
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "galleries", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  create_table "grants", :force => true do |t|
    t.string   "name"
    t.decimal  "amount",           :precision => 8, :scale => 2
    t.text     "description"
    t.datetime "expires"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.boolean  "active"
    t.decimal  "amount_remaining"
  end

  create_table "granttypes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "houses", :force => true do |t|
    t.date     "opened_date"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "region"
    t.text     "web_description"
    t.boolean  "brn"
    t.boolean  "rsj"
    t.string   "mail_address"
    t.string   "mail_city"
    t.string   "mail_state"
    t.string   "mail_zip"
    t.text     "mail_instructions"
    t.boolean  "mail_international"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "website"
    t.string   "calendar"
    t.string   "rent_name"
    t.string   "rent_address"
    t.string   "rent_city"
    t.string   "rent_state"
    t.string   "rent_zip"
    t.text     "rent_instructions"
    t.string   "rent_name_on_check"
    t.string   "programs_per_month"
    t.float    "rent_total"
    t.float    "rent_subsidy"
    t.float    "budget_program"
    t.float    "budget_cleaning"
    t.boolean  "active"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "avatar"
    t.string   "avatar_file_name"
    t.boolean  "featured"
    t.string   "international"
    t.text     "calendar_url"
    t.integer  "director_id"
    t.float    "budget_savings"
    t.string   "mail_name"
    t.boolean  "combinechecks"
    t.decimal  "brn_budget",         :precision => 8, :scale => 2
    t.string   "slug"
  end

  add_index "houses", ["slug"], :name => "index_houses_on_slug", :unique => true

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mhwowcities", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "city"
    t.string   "state"
    t.string   "location"
  end

  create_table "monthly_programs", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "participants", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payperiods", :force => true do |t|
    t.date     "date"
    t.boolean  "locked"
    t.boolean  "locked_rent"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "presses", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.string   "publication"
    t.string   "url"
    t.text     "firstpara"
    t.date     "date"
  end

  add_index "presses", ["date"], :name => "index_presses_on_date"

  create_table "program_photos", :force => true do |t|
    t.integer  "program_id"
    t.integer  "programs_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "name"
  end

  create_table "program_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "program_type_id"
    t.boolean  "partnership"
    t.date     "date"
    t.integer  "attended_total"
    t.integer  "attended_residents"
    t.integer  "attended_new"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "house_id"
    t.integer  "purpose_type"
    t.datetime "completed_date"
    t.datetime "photo_updated_date"
    t.text     "admin_notes"
    t.string   "partner"
    t.integer  "submitter_id"
    t.datetime "submitted_date"
    t.boolean  "direct_service"
    t.boolean  "mhwow"
    t.string   "kevin"
    t.string   "time"
    t.integer  "expected_attendance"
    t.text     "buying"
    t.boolean  "reimbursed"
    t.boolean  "itemized"
    t.boolean  "submit_photos"
    t.string   "image"
    t.string   "file"
    t.string   "status"
    t.integer  "location_id"
    t.integer  "mhwowcity_id"
    t.integer  "gallery_id"
    t.string   "program_photos"
    t.text     "participants"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.string   "program_city"
  end

  create_table "purposes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "receipts", :force => true do |t|
    t.integer  "house_id"
    t.integer  "program_id"
    t.integer  "submitter_id"
    t.integer  "purchaser_id"
    t.decimal  "amount",            :precision => 8, :scale => 2
    t.integer  "grant_id"
    t.text     "description"
    t.boolean  "perishable"
    t.integer  "purpose_id"
    t.string   "status"
    t.integer  "approver_id"
    t.datetime "approved_date"
    t.text     "reject_reason"
    t.string   "receipt_file_name"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.boolean  "closed"
    t.date     "purchase_date"
    t.boolean  "staff"
    t.string   "conference"
    t.datetime "approve_date"
    t.integer  "payperiod_id"
    t.string   "retreat"
    t.string   "kevin"
    t.datetime "submit_date"
  end

  add_index "receipts", ["program_id"], :name => "index_receipts_on_program_id"
  add_index "receipts", ["submitter_id"], :name => "index_receipts_on_submitter_id"

  create_table "rents", :force => true do |t|
    t.integer  "house_id"
    t.decimal  "amount",       :precision => 8, :scale => 2
    t.decimal  "adjustment",   :precision => 8, :scale => 2
    t.text     "notes"
    t.date     "payment_date"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "payperiod_id"
  end

  create_table "tiers", :force => true do |t|
    t.string   "name"
    t.decimal  "amount",     :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.integer  "house_id"
    t.string   "mail_address"
    t.string   "mail_city"
    t.string   "mail_state"
    t.string   "mail_zip"
    t.string   "mail_country"
    t.string   "mail_check_name"
    t.string   "avatar"
    t.string   "phone"
    t.string   "avatar_file_name"
    t.integer  "level_id"
    t.boolean  "rsj"
    t.boolean  "active"
    t.boolean  "alumni"
    t.integer  "rank"
    t.boolean  "staff"
    t.boolean  "mhwow"
    t.boolean  "board"
    t.string   "file"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
