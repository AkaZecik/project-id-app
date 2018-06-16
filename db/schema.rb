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

ActiveRecord::Schema.define(version: 2018_06_15_194005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", primary_key: "appearance_id", id: :serial, force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "event_id", null: false
  end

  create_table "artists", primary_key: "artist_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
  end

  create_table "event_performances", primary_key: ["performance_id", "appearance_id"], force: :cascade do |t|
    t.integer "performance_id", null: false
    t.integer "appearance_id", null: false
  end

  create_table "events", primary_key: "event_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80
    t.string "place", limit: 80, null: false
    t.date "begin_date", null: false
    t.date "end_date", null: false
  end

  create_table "featuring", primary_key: ["artist_id", "song_id"], force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "song_id", null: false
  end

  create_table "functions", primary_key: "name", id: :string, limit: 80, force: :cascade do |t|
  end

  create_table "genre_dependencies", primary_key: ["genre_id", "super_genre_id"], force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "super_genre_id", null: false
  end

  create_table "genres", primary_key: "genre_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
  end

  create_table "member_functions", primary_key: ["member_id", "function", "since"], force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "function", limit: 80, null: false
    t.date "since", null: false
    t.date "until"
  end

  create_table "members", primary_key: "member_id", id: :serial, force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "person_id", null: false
  end

  create_table "people", primary_key: "person_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.string "surname", limit: 80, null: false
    t.string "stage_name", limit: 80
    t.date "date_of_birth", null: false
    t.date "date_of_death"
  end

  create_table "performances", primary_key: "performance_id", id: :serial, force: :cascade do |t|
    t.integer "song_id", null: false
  end

  create_table "production_types", primary_key: "production_type_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.integer "super_type"
  end

  create_table "productions", primary_key: "production_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.string "author", limit: 80, default: "unknown", null: false
    t.integer "production_type_id", null: false
  end

  create_table "radio_performances", primary_key: ["performance_id", "radio", "time"], force: :cascade do |t|
    t.integer "performance_id", null: false
    t.string "radio", limit: 80, null: false
    t.datetime "time", null: false
  end

  create_table "radios", primary_key: "name", id: :string, limit: 80, force: :cascade do |t|
  end

  create_table "records", primary_key: "record_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.date "release_date", null: false
    t.integer "genre_id", null: false
  end

  create_table "songs", primary_key: "song_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.integer "artist_id", null: false
    t.integer "record_id", null: false
    t.interval "interval", null: false
    t.integer "cover_of"
  end

  create_table "soundtracks", primary_key: ["song_id", "production_id"], force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "production_id", null: false
  end

  add_foreign_key "appearances", "artists", primary_key: "artist_id", name: "appearances_artist_id_fkey"
  add_foreign_key "appearances", "events", primary_key: "event_id", name: "appearances_event_id_fkey"
  add_foreign_key "event_performances", "appearances", primary_key: "appearance_id", name: "event_performances_appearance_id_fkey"
  add_foreign_key "event_performances", "performances", primary_key: "performance_id", name: "event_performances_performance_id_fkey"
  add_foreign_key "featuring", "artists", primary_key: "artist_id", name: "featuring_artist_id_fkey"
  add_foreign_key "featuring", "songs", primary_key: "song_id", name: "featuring_song_id_fkey"
  add_foreign_key "genre_dependencies", "genres", column: "super_genre_id", primary_key: "genre_id", name: "genre_dependencies_super_genre_id_fkey"
  add_foreign_key "genre_dependencies", "genres", primary_key: "genre_id", name: "genre_dependencies_genre_id_fkey"
  add_foreign_key "member_functions", "functions", column: "function", primary_key: "name", name: "member_functions_function_fkey"
  add_foreign_key "member_functions", "members", primary_key: "member_id", name: "member_functions_member_id_fkey"
  add_foreign_key "members", "artists", primary_key: "artist_id", name: "members_artist_id_fkey"
  add_foreign_key "members", "people", primary_key: "person_id", name: "members_person_id_fkey"
  add_foreign_key "performances", "songs", primary_key: "song_id", name: "performances_song_id_fkey"
  add_foreign_key "production_types", "production_types", column: "super_type", primary_key: "production_type_id", name: "production_types_super_type_fkey"
  add_foreign_key "productions", "production_types", primary_key: "production_type_id", name: "productions_production_type_id_fkey"
  add_foreign_key "radio_performances", "performances", primary_key: "performance_id", name: "radio_performances_performance_id_fkey"
  add_foreign_key "radio_performances", "radios", column: "radio", primary_key: "name", name: "radio_performances_radio_fkey"
  add_foreign_key "records", "genres", primary_key: "genre_id", name: "records_genre_id_fkey"
  add_foreign_key "songs", "artists", primary_key: "artist_id", name: "songs_artist_id_fkey"
  add_foreign_key "songs", "records", primary_key: "record_id", name: "songs_record_id_fkey"
  add_foreign_key "songs", "songs", column: "cover_of", primary_key: "song_id", name: "songs_cover_of_fkey"
  add_foreign_key "soundtracks", "productions", primary_key: "production_id", name: "soundtracks_production_id_fkey"
  add_foreign_key "soundtracks", "songs", primary_key: "song_id", name: "soundtracks_song_id_fkey"
end
