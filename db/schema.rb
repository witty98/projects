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

ActiveRecord::Schema.define(version: 20160120135942) do

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "duty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "implements", force: :cascade do |t|
    t.string   "job"
    t.integer  "project_id"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "implements", ["department_id"], name: "index_implements_on_department_id"
  add_index "implements", ["project_id", "department_id"], name: "index_implements_on_project_id_and_department_id", unique: true
  add_index "implements", ["project_id"], name: "index_implements_on_project_id"

  create_table "partakers", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "partakers", ["project_id", "user_id"], name: "index_partakers_on_project_id_and_user_id", unique: true
  add_index "partakers", ["project_id"], name: "index_partakers_on_project_id"
  add_index "partakers", ["user_id"], name: "index_partakers_on_user_id"

  create_table "partybs", force: :cascade do |t|
    t.string   "name"
    t.string   "corporation"
    t.string   "contacts"
    t.string   "corporation_tel"
    t.string   "contacts_tel"
    t.string   "address"
    t.string   "postcode"
    t.string   "bank"
    t.string   "account"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.date     "start"
    t.date     "plan_end"
    t.date     "end"
    t.integer  "status"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plans", ["project_id"], name: "index_plans_on_project_id"

  create_table "project_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_types", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "monthid"
    t.date     "start_time"
    t.date     "end_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "ProjectType_id"
    t.integer  "ProjectStatus_id"
  end

  add_index "projects", ["ProjectStatus_id"], name: "index_projects_on_ProjectStatus_id"
  add_index "projects", ["ProjectType_id"], name: "index_projects_on_ProjectType_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "namecn"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "role",            default: 1
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

  create_table "worklogs", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "worklogs", ["user_id", "created_at"], name: "index_worklogs_on_user_id_and_created_at"
  add_index "worklogs", ["user_id"], name: "index_worklogs_on_user_id"

end
