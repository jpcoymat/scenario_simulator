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

ActiveRecord::Schema.define(version: 2018_04_24_213410) do

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
  end

  create_table "movement_sources", force: :cascade do |t|
    t.string "reference_number"
    t.string "type"
    t.date "eta"
    t.date "etd"
    t.integer "product_id"
    t.integer "location_id"
    t.decimal "quantity"
    t.decimal "original_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "buyer"
    t.string "division_id"
    t.string "seller_id"
    t.string "logistics_provider"
    t.string "carrier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
