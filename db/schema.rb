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

ActiveRecord::Schema.define(version: 20151106070836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gmail_oauths", force: :cascade do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string   "creator_gmail_address", null: false
    t.string   "invited_user_cookie",   null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars",        null: false
    t.integer  "submitter_id", null: false
    t.text     "reason"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "signups", force: :cascade do |t|
    t.string   "invited_user_cookie", null: false
    t.string   "first_name",          null: false
    t.string   "last_name",           null: false
    t.string   "email",               null: false
    t.string   "linkedin_url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "gmail_address", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "access_token",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
