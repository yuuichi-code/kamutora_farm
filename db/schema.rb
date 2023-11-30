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

ActiveRecord::Schema[7.0].define(version: 2023_11_22_133640) do
  create_table "actions", force: :cascade do |t|
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_actions_on_content", unique: true
  end

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
    t.index ["chapter_number"], name: "index_chapters_on_chapter_number", unique: true
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit_element", null: false
    t.integer "initial_rarity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_characters_on_name", unique: true
  end

  create_table "farm_places", force: :cascade do |t|
    t.integer "farm_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_number"], name: "index_farm_places_on_farm_number", unique: true
  end

  create_table "flower_seeds", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_flower_seeds_on_name", unique: true
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

  create_table "training_characters", force: :cascade do |t|
    t.integer "hp"
    t.integer "atk"
    t.integer "def"
    t.integer "spd"
    t.integer "crt"
    t.integer "crd"
    t.integer "hit"
    t.integer "avd"
    t.integer "max_exp"
    t.integer "character_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_training_characters_on_character_id"
    t.index ["post_id"], name: "index_training_characters_on_post_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "turn_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turn_number"], name: "index_turns_on_turn_number", unique: true
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
  add_foreign_key "training_characters", "characters"
  add_foreign_key "training_characters", "posts"
end
