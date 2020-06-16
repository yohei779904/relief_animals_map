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

ActiveRecord::Schema.define(version: 20200610111033) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "name"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rescuer_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rescue_station", null: false
    t.string "rescue_station_kana", null: false
    t.string "representative", null: false
    t.string "representative_kana", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "post_code", null: false
    t.string "home_address", null: false
    t.string "password_digest", null: false
    t.text "comment"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rescuestation_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.bigint "rescuer_member_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_rescuestation_items_on_item_id"
    t.index ["rescuer_member_id"], name: "index_rescuestation_items_on_rescuer_member_id"
  end

  create_table "support_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rescuestation_items", "items"
  add_foreign_key "rescuestation_items", "rescuer_members"
end
