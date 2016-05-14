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

ActiveRecord::Schema.define(version: 20160514083943) do

  create_table "branches", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "m_books", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "isbn",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "m_book_id",      limit: 4
    t.integer  "status",         limit: 4
    t.integer  "rental_user_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.integer  "m_book_id",       limit: 4
    t.integer  "status",          limit: 4, default: 0, null: false
    t.integer  "request_user_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "product_id",        limit: 4
    t.string   "original_filename", limit: 255
    t.string   "content_type",      limit: 255
    t.binary   "image",             limit: 16777215
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "recommends", force: :cascade do |t|
    t.integer  "sender_id",   limit: 4
    t.integer  "product_id",  limit: 4
    t.integer  "receiver_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "recommends", ["product_id"], name: "index_recommends_on_product_id", using: :btree
  add_index "recommends", ["receiver_id"], name: "index_recommends_on_receiver_id", using: :btree
  add_index "recommends", ["sender_id"], name: "index_recommends_on_sender_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: ""
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "username",               limit: 255
    t.string   "image",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
