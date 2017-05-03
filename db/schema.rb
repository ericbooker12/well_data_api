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

ActiveRecord::Schema.define(version: 20170428232014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "depth_data", force: :cascade do |t|
    t.float    "depth"
    t.float    "rop"
    t.float    "wob"
    t.float    "temp_in"
    t.float    "temp_out"
    t.float    "pressure"
    t.integer  "well_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["well_id"], name: "index_depth_data_on_well_id", using: :btree
  end

  create_table "descriptions", force: :cascade do |t|
    t.float    "depth"
    t.text     "content"
    t.integer  "well_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["well_id"], name: "index_descriptions_on_well_id", using: :btree
  end

  create_table "lithologies", force: :cascade do |t|
    t.string   "depth"
    t.float    "blank"
    t.float    "cement"
    t.float    "graywacke"
    t.float    "greenstone"
    t.float    "chert"
    t.float    "mum"
    t.float    "blueschist"
    t.float    "argillite"
    t.float    "serpentine"
    t.float    "clay"
    t.float    "peridotite"
    t.integer  "well_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["well_id"], name: "index_lithologies_on_well_id", using: :btree
  end

  create_table "mineralogies", force: :cascade do |t|
    t.float    "depth"
    t.float    "quartz"
    t.float    "calcite"
    t.float    "pyrite"
    t.float    "pyrrhotite"
    t.float    "chloite"
    t.float    "axinite"
    t.float    "actinolite"
    t.float    "tourmaline"
    t.integer  "well_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["well_id"], name: "index_mineralogies_on_well_id", using: :btree
  end

  create_table "well_symbols", force: :cascade do |t|
    t.float    "depth"
    t.string   "symbol"
    t.integer  "well_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["well_id"], name: "index_well_symbols_on_well_id", using: :btree
  end

  create_table "wells", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "total_depth"
    t.integer  "well_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "depth_data", "wells"
  add_foreign_key "descriptions", "wells"
  add_foreign_key "lithologies", "wells"
  add_foreign_key "mineralogies", "wells"
  add_foreign_key "well_symbols", "wells"
end
