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

ActiveRecord::Schema.define(version: 20180614191550) do

  create_table "ep_search_caches", force: :cascade do |t|
    t.text "full_search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_ep_search_caches_on_star_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "star_id"
    t.integer "podcast_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_id"
    t.date "release_date"
    t.index ["podcast_id"], name: "index_episodes_on_podcast_id"
    t.index ["star_id"], name: "index_episodes_on_star_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "name"
    t.string "host"
    t.string "feed"
    t.text "desctiption"
    t.string "homepage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "image_url"
  end

  create_table "search_caches", force: :cascade do |t|
    t.text "search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "star_id"
  end

  create_table "stars", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

end
