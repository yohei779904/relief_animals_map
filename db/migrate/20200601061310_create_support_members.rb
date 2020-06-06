class CreateSupportMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :support_members do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :email, null: false
      t.string :password_digest
      t.boolean :suspended, default: false, null: false

      t.timestamps
    end
  end
end
