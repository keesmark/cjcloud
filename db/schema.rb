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

ActiveRecord::Schema.define(version: 20171007055645) do

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "b_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "b_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "b_area_id"
    t.integer  "b_category_id"
    t.string   "title"
    t.text     "content",       limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["b_area_id"], name: "index_boards_on_b_area_id", using: :btree
    t.index ["b_category_id"], name: "index_boards_on_b_category_id", using: :btree
    t.index ["user_id"], name: "index_boards_on_user_id", using: :btree
  end

  create_table "c_boards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "area_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "content",     limit: 65535
    t.string   "image"
    t.string   "s_image"
    t.string   "t_image"
    t.string   "f_image"
    t.string   "tel"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["area_id"], name: "index_c_boards_on_area_id", using: :btree
    t.index ["category_id"], name: "index_c_boards_on_category_id", using: :btree
    t.index ["user_id"], name: "index_c_boards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "board_id"
    t.integer  "user_id"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["board_id"], name: "index_comments_on_board_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin_flag",      default: false
  end

  add_foreign_key "boards", "b_areas"
  add_foreign_key "boards", "b_categories"
  add_foreign_key "boards", "users"
  add_foreign_key "c_boards", "areas"
  add_foreign_key "c_boards", "categories"
  add_foreign_key "c_boards", "users"
  add_foreign_key "comments", "boards"
  add_foreign_key "comments", "users"
end
