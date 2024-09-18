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

ActiveRecord::Schema[7.2].define(version: 2024_09_18_181314) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "careers_page"
    t.text "description"
    t.bigint "city_id", null: false
    t.string "slug", null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "company_technologies", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "technology_id", null: false
    t.index ["company_id", "technology_id"], name: "index_company_technologies_on_company_id_and_technology_id", unique: true
    t.index ["company_id"], name: "index_company_technologies_on_company_id"
    t.index ["technology_id"], name: "index_company_technologies_on_technology_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_continents_on_slug", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "continent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["continent_id"], name: "index_countries_on_continent_id"
    t.index ["slug"], name: "index_countries_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false
    t.string "background_color"
    t.string "text_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_technologies_on_name", unique: true
  end

  add_foreign_key "cities", "regions"
  add_foreign_key "companies", "cities"
  add_foreign_key "company_technologies", "companies"
  add_foreign_key "company_technologies", "technologies"
  add_foreign_key "countries", "continents"
  add_foreign_key "regions", "countries"
end
