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

ActiveRecord::Schema.define(version: 20180823131524) do

  create_table "givecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "give_id"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "givecomments", ["give_id"], name: "index_givecomments_on_give_id"
  add_index "givecomments", ["user_id"], name: "index_givecomments_on_user_id"

  create_table "gives", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "title"
    t.string   "image_url",  default: ""
    t.string   "name"
    t.integer  "check",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "gives", ["user_id"], name: "index_gives_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "likeCount"
    t.integer  "tip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "need_id"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "needcomments", ["need_id"], name: "index_needcomments_on_need_id"
  add_index "needcomments", ["user_id"], name: "index_needcomments_on_user_id"

  create_table "needs", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "title"
    t.string   "image_url",  default: ""
    t.string   "name"
    t.string   "s3_file"
    t.integer  "check",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "needs", ["user_id"], name: "index_needs_on_user_id"

  create_table "noticecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notice_id"
    t.string   "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "noticecomments", ["notice_id"], name: "index_noticecomments_on_notice_id"
  add_index "noticecomments", ["user_id"], name: "index_noticecomments_on_user_id"

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "image_url",  default: ""
    t.string   "name"
    t.integer  "check",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id"

  create_table "sellcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sell_id"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sellcomments", ["sell_id"], name: "index_sellcomments_on_sell_id"
  add_index "sellcomments", ["user_id"], name: "index_sellcomments_on_user_id"

  create_table "sells", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "title"
    t.string   "image_url",  default: ""
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sells", ["user_id"], name: "index_sells_on_user_id"

  create_table "tipcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tipcomments", ["tip_id"], name: "index_tipcomments_on_tip_id"
  add_index "tipcomments", ["user_id"], name: "index_tipcomments_on_user_id"

  create_table "tips", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "title"
    t.string   "image_url",  default: ""
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tips", ["user_id"], name: "index_tips_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.integer  "point",                  default: 0
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
  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["point"], name: "index_users_on_point"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
