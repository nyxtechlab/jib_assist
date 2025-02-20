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

ActiveRecord::Schema[7.1].define(version: 2025_01_10_142923) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bots", force: :cascade do |t|
    t.text "name"
    t.text "platform"
    t.json "config_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "message_id"
    t.text "user_id"
    t.text "channel_id"
    t.text "message_type"
    t.text "content"
    t.text "platform"
    t.text "botname"
    t.datetime "sent_at"
    t.json "raw_data_store"
    t.json "extra_data_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
