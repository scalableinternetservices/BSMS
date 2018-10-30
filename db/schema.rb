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

ActiveRecord::Schema.define(version: 20181030005659) do

  create_table "listing_contracts", force: :cascade do |t|
    t.datetime "expiration_date"
    t.boolean  "expired",         default: false, null: false
    t.integer  "listing_id"
    t.integer  "subleaser_id"
    t.integer  "subletter_id"
  end

  create_table "listing_requests", force: :cascade do |t|
    t.string  "request_message"
    t.boolean "expired",         default: false, null: false
    t.integer "listing_id"
    t.integer "subleaser_id"
  end

  create_table "listing_reviews", force: :cascade do |t|
    t.integer "rating"
    t.string  "review"
    t.integer "listing_id"
    t.integer "user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string  "location"
    t.integer "price"
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
    t.string  "start_date"
    t.string  "end_date"
    t.string  "title"
    t.boolean "available",             default: true, null: false
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

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
