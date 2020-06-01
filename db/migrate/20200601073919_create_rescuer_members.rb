class CreateRescuerMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :rescuer_members do |t|

      t.string :rescue_station_name, null: false
      t.string :rescue_station_name_kana, null: false
      t.string :representative, null: false
      t.string :representative_lastname_kana, null: false
      t.string :representative_firstname_kana, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :post_code, null: false
      t.string :home_address, null: false
      t.string :password_digest, null: false
      t.date :start_date # 開始日
      t.date :end_date # 終了日
      t.string :homepage
      t.text :comment
      t.boolean :suspended, default: false, null: false

      t.timestamps
    end
  end
end
