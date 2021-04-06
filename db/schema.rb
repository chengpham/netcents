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

ActiveRecord::Schema.define(version: 2021_04_04_030120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bitcoins", force: :cascade do |t|
    t.string "_hash"
    t.bigint "total"
    t.bigint "fees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["_hash"], name: "index_bitcoins_on__hash", unique: true
  end

  create_table "inputs", force: :cascade do |t|
    t.string "prev_hash"
    t.bigint "output_value"
    t.string "addresses", array: true
    t.bigint "bitcoin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bitcoin_id"], name: "index_inputs_on_bitcoin_id"
  end

  create_table "outputs", force: :cascade do |t|
    t.bigint "value"
    t.string "addresses", array: true
    t.bigint "bitcoin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bitcoin_id"], name: "index_outputs_on_bitcoin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "inputs", "bitcoins"
  add_foreign_key "outputs", "bitcoins"
end
