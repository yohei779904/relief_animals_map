ActiveRecord::Schema.define(version: 20200601073919) do

  create_table "rescuer_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "rescue_station_name", null: false
    t.string "rescue_station_name_kana", null: false
    t.string "representative", null: false
    t.string "representative_lastname_kana", null: false
    t.string "representative_firstname_kana", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "post_code", null: false
    t.string "home_address", null: false
    t.string "password_digest", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "homepage"
    t.text "comment"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "support_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.string "lastname_kana", null: false
    t.string "firstname_kana", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.date "start_date"
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
