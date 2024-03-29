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

ActiveRecord::Schema.define(version: 2019_03_26_130057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "all_share_flg"
    t.text "description"
  end

  create_table "good_categories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "informations", force: :cascade do |t|
    t.datetime "announce_date"
    t.string "title"
    t.text "contents"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "category_id"
    t.text "question"
    t.text "answer"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_access_categories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "mail_address"
    t.string "name"
    t.string "password_digest"
    t.date "birthday"
    t.integer "temp_regist_flg"
    t.integer "password_init_flg"
    t.datetime "password_init_updated_at"
    t.integer "admin_flg"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
