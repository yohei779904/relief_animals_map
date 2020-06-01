class CreateSupportMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :support_members do |t|
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :lastname_kana, null: false
      t.string :firstname_kana, null: false
      t.string :email, null: false
      t.string :password_digest
      t.date :start_date # 開始日
      t.date :end_date # 終了日
      t.boolean :suspended, default: false, null: false

      t.timestamps
    end
  end
end
