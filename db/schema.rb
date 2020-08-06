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

ActiveRecord::Schema.define(version: 2020_08_05_165610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "homes", force: :cascade do |t|
    t.string "name", null: false
    t.string "status", null: false
    t.bigint "price", null: false
    t.integer "beds", default: 0, null: false
    t.integer "baths", default: 0, null: false
    t.geography "coords", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}, null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coords"], name: "index_homes_on_coords", using: :gist
    t.index ["latitude", "longitude"], name: "index_homes_on_latitude_and_longitude"
    t.index ["price"], name: "index_homes_on_price"
    t.index ["status"], name: "index_homes_on_status"
  end

  create_table "schools", force: :cascade do |t|
    t.geography "coords", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coords"], name: "index_schools_on_coords", using: :gist
  end

end
