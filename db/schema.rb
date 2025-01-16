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

ActiveRecord::Schema[8.1].define(version: 2024_12_30_111019) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "extension_id", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_id"], name: "index_boards_on_extension_id"
    t.index ["name"], name: "index_boards_on_name", unique: true
  end

  create_table "corporations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "extension_id", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_id"], name: "index_corporations_on_extension_id"
    t.index ["name"], name: "index_corporations_on_name", unique: true
  end

  create_table "extensions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_extensions_on_name", unique: true
  end

  create_table "extensions_games", id: false, force: :cascade do |t|
    t.integer "extension_id", null: false
    t.integer "game_id", null: false
    t.index ["extension_id"], name: "index_extensions_games_on_extension_id"
    t.index ["game_id"], name: "index_extensions_games_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "board_id", null: false
    t.datetime "created_at", null: false
    t.integer "num_generations"
    t.boolean "ranked", default: true, null: false
    t.datetime "time"
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_games_on_board_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "corporation_id"
    t.datetime "created_at", null: false
    t.integer "elo_impact"
    t.integer "game_id", null: false
    t.integer "rank"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "victory_points", null: false
    t.index ["corporation_id"], name: "index_players_on_corporation_id"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "somethings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "boards", "extensions"
  add_foreign_key "corporations", "extensions"
  add_foreign_key "games", "boards"
  add_foreign_key "players", "corporations"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
  add_foreign_key "sessions", "users"
end
