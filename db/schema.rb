# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_194209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string "station"
    t.string "data"
    t.integer "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brightness_sensors", force: :cascade do |t|
    t.time "timestamp"
    t.float "brightness"
    t.integer "ldr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "camera_positions", force: :cascade do |t|
    t.float "pan"
    t.float "tilt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cameras", force: :cascade do |t|
    t.string "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dsi_states", force: :cascade do |t|
    t.integer "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dso_states", force: :cascade do |t|
    t.integer "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "environment_sensors", force: :cascade do |t|
    t.time "timestamp"
    t.float "temperature"
    t.integer "airquality"
    t.integer "aqs"
    t.float "humidity"
    t.float "airpressure"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hbw_states", force: :cascade do |t|
    t.integer "active"
    t.time "timestamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mpo_states", force: :cascade do |t|
    t.integer "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time "timestamp"
  end

  create_table "order_targets", force: :cascade do |t|
    t.integer "quantity"
    t.string "time"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "t"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.time "timestamp"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "t"
    t.string "time"
    t.integer "quality"
  end

  create_table "sld_states", force: :cascade do |t|
    t.integer "active"
    t.time "timestamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "stockitems"
    t.time "timestamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vgr_states", force: :cascade do |t|
    t.integer "active"
    t.string "target"
    t.time "timestamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workpieces", force: :cascade do |t|
    t.string "history"
    t.string "code100"
    t.string "code200"
    t.string "code800"
    t.string "state"
    t.string "color"
    t.string "workpiece_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
