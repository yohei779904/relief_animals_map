class CreateRescuerMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :rescuer_members do |t|

      t.string :rescue_station, null: false
      t.string :rescue_station_kana, null: false
      t.string :representative, null: false
      t.string :representative_kana, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :post_code, null: false
      t.string :home_address, null: false
      t.string :password_digest, null: false
      t.text :comment
      t.boolean :suspended, default: false, null: false

      t.timestamps
    end
  end
end
