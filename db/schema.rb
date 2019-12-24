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

ActiveRecord::Schema.define(version: 2019_11_24_141434) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "phone"
    t.boolean "active"
    t.string "email"
    t.string "site"
    t.string "equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "region_id"
    t.integer "user_id"
    t.integer "status_id"
    t.integer "jurface_id"
    t.integer "equipment_id"
    t.index ["equipment_id"], name: "index_companies_on_equipment_id"
    t.index ["jurface_id"], name: "index_companies_on_jurface_id"
    t.index ["region_id"], name: "index_companies_on_region_id"
    t.index ["status_id"], name: "index_companies_on_status_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "companies_contacts", force: :cascade do |t|
    t.integer "company_id"
    t.integer "contact_id"
    t.index ["company_id"], name: "index_companies_contacts_on_company_id"
    t.index ["contact_id"], name: "index_companies_contacts_on_contact_id"
  end

  create_table "companies_instruments", force: :cascade do |t|
    t.integer "company_id"
    t.integer "instrument_id"
    t.index ["company_id"], name: "index_companies_instruments_on_company_id"
    t.index ["instrument_id"], name: "index_companies_instruments_on_instrument_id"
  end

  create_table "companies_services", force: :cascade do |t|
    t.integer "company_id"
    t.integer "service_id"
    t.index ["company_id"], name: "index_companies_services_on_company_id"
    t.index ["service_id"], name: "index_companies_services_on_service_id"
  end

  create_table "companies_sphereworks", force: :cascade do |t|
    t.integer "company_id"
    t.integer "spherework_id"
    t.index ["company_id"], name: "index_companies_sphereworks_on_company_id"
    t.index ["spherework_id"], name: "index_companies_sphereworks_on_spherework_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "position"
    t.date "birthday"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.text "name"
    t.string "manufacturer"
    t.string "speed"
    t.string "shaft"
    t.string "type"
    t.string "feedrate"
    t.boolean "cnc"
    t.string "comment"
    t.string "photo"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_equipment_on_company_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jurfaces", force: :cascade do |t|
    t.string "name", null: false
    t.string "inn"
    t.string "acc"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jurfaces_on_company_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sphereworks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.text "text"
    t.integer "typetalk_id"
    t.integer "user_id"
    t.integer "company_id"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_talks_on_company_id"
    t.index ["contact_id"], name: "index_talks_on_contact_id"
    t.index ["typetalk_id"], name: "index_talks_on_typetalk_id"
    t.index ["user_id"], name: "index_talks_on_user_id"
  end

  create_table "typetalks", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.text "pass"
    t.integer "role_id"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_users_on_region_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
