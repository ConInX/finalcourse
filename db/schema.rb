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

ActiveRecord::Schema.define(version: 20160109044706) do

  create_table "articles", force: :cascade do |t|
    t.string   "articlename"
    t.text     "content"
    t.string   "coursename"
    t.string   "name"
    t.date     "createtime"
    t.decimal  "viewtimes"
    t.decimal  "answertimes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "articlename"
    t.string   "name"
    t.string   "coursename"
    t.date     "createtime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "coursename"
    t.string   "classtime"
    t.string   "classroom"
    t.string   "tercher"
    t.string   "university"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindeditor_images", force: :cascade do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: :cascade do |t|
    t.string   "universityname"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usercourses", force: :cascade do |t|
    t.string   "name"
    t.string   "coursename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "gendar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "useruniversities", force: :cascade do |t|
    t.string   "name"
    t.string   "universityname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
