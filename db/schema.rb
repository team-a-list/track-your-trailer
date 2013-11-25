# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131125232051) do

  create_table "movies", force: true do |t|
    t.string   "name"
    t.datetime "release_date_theater"
    t.datetime "release_date_dvd"
    t.string   "poster_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rotten_tomatoes_uri"
    t.text     "synopsis"
    t.string   "poster_image_small"
    t.string   "rotten_tomatoes_link"
  end

  create_table "user_movies", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_movies", ["movie_id"], name: "index_user_movies_on_movie_id"
  add_index "user_movies", ["user_id"], name: "index_user_movies_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                default: "", null: false
    t.string   "encrypted_password",   default: "", null: false
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "text_token"
    t.boolean  "phone_verified"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
