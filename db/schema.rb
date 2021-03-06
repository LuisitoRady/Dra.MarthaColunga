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

ActiveRecord::Schema.define(version: 2018_11_29_020340) do

  create_table "appointments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "appointment_date"
    t.integer "responsable"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "archives", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document"
    t.index ["user_id"], name: "index_archives_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.integer "pills"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines_treatments", id: false, force: :cascade do |t|
    t.integer "treatment_id", null: false
    t.integer "medicine_id", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string "dosis"
    t.text "instructions"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "names"
    t.string "lastnames"
    t.string "type"
    t.integer "age"
    t.string "cellphone"
    t.string "email"
    t.integer "init_preg_week"
    t.decimal "salary"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["category_id"], name: "index_users_on_category_id"
  end

end
