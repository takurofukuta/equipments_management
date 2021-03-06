# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_25_104418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.integer "genre", null: false
    t.string "lab_equipment_name", null: false
    t.string "maker_name", null: false
    t.string "product_name", null: false
    t.integer "purchase_year", null: false
    t.string "asset_num"
    t.integer "price"
    t.integer "lendings_status", default: 0, null: false
    t.integer "disposal_status", default: 0, null: false
    t.text "remarks"
    t.integer "registered_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registered_user_id"], name: "index_equipment_on_registered_user_id"
  end

  create_table "lendings", force: :cascade do |t|
    t.integer "lending_user_id", null: false
    t.integer "borrowed_equipment_id", null: false
    t.integer "lendings_status", default: 0, null: false
    t.datetime "return_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrowed_equipment_id"], name: "index_lendings_on_borrowed_equipment_id"
    t.index ["lending_user_id"], name: "index_lendings_on_lending_user_id"
  end

  create_table "operation_histories", force: :cascade do |t|
    t.integer "content", null: false
    t.string "object", null: false
    t.integer "operated_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["operated_user_id"], name: "index_operation_histories_on_operated_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_name", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.integer "assignment_year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "equipment", "users", column: "registered_user_id"
  add_foreign_key "lendings", "equipment", column: "borrowed_equipment_id"
  add_foreign_key "lendings", "users", column: "lending_user_id"
  add_foreign_key "operation_histories", "users", column: "operated_user_id"
end
