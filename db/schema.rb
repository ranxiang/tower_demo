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

ActiveRecord::Schema.define(version: 20170216024338) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "todo_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["todo_id"], name: "index_comments_on_todo_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "event_type"
    t.text     "ext_data",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["project_id"], name: "index_events_on_project_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_projects_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",     limit: 65535
    t.boolean  "deleted"
    t.boolean  "finished"
    t.datetime "finished_at"
    t.integer  "project_id"
    t.integer  "creator_id"
    t.integer  "assignee_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["assignee_id"], name: "index_todos_on_assignee_id", using: :btree
    t.index ["creator_id"], name: "index_todos_on_creator_id", using: :btree
    t.index ["project_id"], name: "index_todos_on_project_id", using: :btree
  end

  create_table "user_project_assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_project_assignments_on_project_id", using: :btree
    t.index ["user_id"], name: "index_user_project_assignments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  add_foreign_key "comments", "todos"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "projects"
  add_foreign_key "events", "users"
  add_foreign_key "projects", "teams"
  add_foreign_key "todos", "projects"
  add_foreign_key "todos", "users", column: "assignee_id"
  add_foreign_key "todos", "users", column: "creator_id"
  add_foreign_key "user_project_assignments", "projects"
  add_foreign_key "user_project_assignments", "users"
  add_foreign_key "users", "teams"
end
