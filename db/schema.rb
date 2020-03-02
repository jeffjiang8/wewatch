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

ActiveRecord::Schema.define(version: 2019_10_25_022618) do

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "episode_id"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "season_id"
    t.string "name"
    t.string "overview"
    t.string "air_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "episode_number"
  end

  create_table "followings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "followed_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_user_id"], name: "index_followings_on_followed_user_id"
    t.index ["user_id", "followed_user_id"], name: "index_followings_on_user_id_and_followed_user_id", unique: true
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "followed_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_user_id"], name: "index_follows_on_followed_user_id"
    t.index ["user_id", "followed_user_id"], name: "index_follows_on_user_id_and_followed_user_id", unique: true
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "show_id"
    t.string "name"
    t.integer "episode_count"
    t.string "overview"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "season_number"
    t.boolean "has_episodes_loaded", default: false
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.string "overview"
    t.integer "num_of_seasons"
    t.string "poster_path"
    t.integer "vote_avg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_achievements", force: :cascade do |t|
    t.integer "user_id"
    t.integer "achievement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "password_digest"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "views", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
    t.string "status", default: "Not Watching"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "episode_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "watched", default: false
  end

end
