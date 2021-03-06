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

ActiveRecord::Schema.define(version: 20170326000708) do

  create_table "addresses", force: :cascade do |t|
    t.string   "label"
    t.string   "street"
    t.string   "number"
    t.string   "other"
    t.string   "neighborhood"
    t.string   "zip"
    t.string   "kind"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "city"
    t.string   "state"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.text     "items"
    t.float    "total"
    t.integer  "shipping_address_id"
    t.integer  "billing_address_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["plan_id"], name: "index_orders_on_plan_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "period"
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "properties"
    t.float    "price"
    t.boolean  "available"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "brand_id"
    t.         "files"
    t.text     "description"
    t.float    "weight"
    t.float    "height"
    t.float    "width"
    t.float    "depth"
    t.text     "tags"
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "kind",                   default: "U"
    t.string   "name"
    t.text     "pets"
    t.string   "uuid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
