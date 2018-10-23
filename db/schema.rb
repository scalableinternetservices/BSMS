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

ActiveRecord::Schema.define(version: 20181023220516) do

  create_table "listing_reviews", force: :cascade do |t|
    t.integer "rating"
    t.string  "review"
    t.integer "listing_id"
    t.integer "user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string  "location"
    t.integer "price"
    t.integer "duration"
    t.string  "amenities"
    t.string  "housing_type"
    t.string  "description"
    t.integer "user_id"
    t.integer "bedrooms"
    t.integer "parking"
    t.string  "weather"
    t.integer "bathrooms"
    t.boolean "gym"
    t.boolean "pet_friendly"
    t.boolean "ac"
    t.boolean "heater"
    t.boolean "wifi"
    t.boolean "wash_and_dry"
    t.boolean "yard"
    t.boolean "public_transportation"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "bedrooms"
    t.integer "parking"
    t.integer "price"
    t.string  "weather"
    t.integer "user_id"
    t.integer "bathrooms"
    t.boolean "gym"
    t.boolean "pet_friendly"
    t.boolean "ac"
    t.boolean "heater"
    t.boolean "wifi"
    t.boolean "wash_and_dry"
    t.boolean "yard"
    t.boolean "public_transportation"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.text     "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
