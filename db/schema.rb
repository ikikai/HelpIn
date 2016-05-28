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

ActiveRecord::Schema.define(version: 20160528153511) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "gender"
    t.integer  "age"
    t.date     "birthday"
    t.string   "city"
    t.string   "problem_category"
    t.integer  "expert_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "expert_id", null: false
  end

  create_table "experts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "bio"
    t.string   "specialization"
    t.decimal  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id", null: false
    t.text     "text"
    t.string   "sender_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
