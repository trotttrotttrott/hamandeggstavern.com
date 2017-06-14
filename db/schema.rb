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

ActiveRecord::Schema.define(version: 20170614021316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
  end

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "beer_classifications", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "beers", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "percentage_of_alcohol"
    t.string   "image"
    t.integer  "producer_id"
    t.integer  "beer_classification_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "rank"
    t.boolean  "is_draft"
    t.boolean  "is_shit_can"
    t.boolean  "is_craft_can"
  end

  create_table "event_participations", force: true do |t|
    t.integer  "event_id"
    t.integer  "act_id"
    t.integer  "act_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.text     "words"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "price"
    t.string   "poster"
  end

  create_table "integrations", force: true do |t|
    t.integer  "admin_id"
    t.string   "token"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patrons", force: true do |t|
    t.string   "email"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "mail_list_subscribe_posted_at"
    t.boolean  "mail_is_subscribed",            default: false
  end

  create_table "producers", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wines", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "percentage_of_alcohol"
    t.integer  "points"
    t.string   "image"
    t.integer  "producer_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "rank"
  end

end
