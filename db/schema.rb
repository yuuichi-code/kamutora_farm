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

ActiveRecord::Schema[7.0].define(version: 2023_09_22_131349) do
  create_table "chapter_turns", force: :cascade do |t|
    t.integer "chapter_id", null: false
    t.integer "turn_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id", "turn_id"], name: "index_chapter_turns_on_chapter_id_and_turn_id", unique: true
    t.index ["chapter_id"], name: "index_chapter_turns_on_chapter_id"
    t.index ["turn_id"], name: "index_chapter_turns_on_turn_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "chapter_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit_element", null: false
    t.integer "initial_rarity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_characters_on_name", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "support_characters", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_support_characters_on_character_id"
    t.index ["post_id", "character_id"], name: "index_support_characters_on_post_id_and_character_id", unique: true
    t.index ["post_id"], name: "index_support_characters_on_post_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "turn_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "chapter_turns", "chapters"
  add_foreign_key "chapter_turns", "turns"
  add_foreign_key "posts", "users"
  add_foreign_key "support_characters", "characters"
  add_foreign_key "support_characters", "posts"
end
