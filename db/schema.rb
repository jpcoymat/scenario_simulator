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

ActiveRecord::Schema.define(version: 2018_07_09_021052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state_providence"
    t.string "postal_code"
    t.string "country"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
  end

  create_table "movement_sources", force: :cascade do |t|
    t.string "reference_number"
    t.string "type"
    t.date "eta"
    t.date "etd"
    t.integer "product_id"
    t.integer "destination_location_id"
    t.decimal "quantity"
    t.decimal "original_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enterprise_organization_id"
    t.integer "supplier_organization_id"
    t.integer "customer_organization_id"
    t.integer "carrier_organization_id"
    t.integer "logistics_organization_id"
    t.integer "origin_location_id"
    t.integer "transportation_mode_id"
  end

  create_table "organization_links", force: :cascade do |t|
    t.integer "focal_organization_id"
    t.integer "service_organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_function"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "large_id"
    t.integer "division_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "supply_order_class"
    t.string "demand_order_class"
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
    t.decimal "unit_weight", precision: 15, scale: 5
    t.decimal "unit_volume", precision: 15, scale: 5
    t.decimal "unit_price", precision: 10, scale: 2
  end

  create_table "scenario_projections", force: :cascade do |t|
    t.integer "scenario_id"
    t.integer "projection_order"
    t.decimal "on_hand_quantity"
    t.decimal "supply_forecast_quantity"
    t.decimal "on_order_quantity"
    t.decimal "in_transit_quantity"
    t.decimal "allocated_quantity"
    t.decimal "demand_forecast_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenarios", force: :cascade do |t|
    t.integer "product_id"
    t.integer "location_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enterprise_organization_id"
    t.integer "supplier_organization_id"
    t.integer "customer_organization_id"
    t.integer "carrier_organization_id"
    t.integer "logistics_organization_id"
  end

  create_table "transportation_modes", force: :cascade do |t|
    t.string "mode_description"
    t.string "mode_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
