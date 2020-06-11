class CreateSupporterItems < ActiveRecord::Migration[5.1]
  def change
    create_table :supporter_items do |t|
      t.references :support_member, foreign_key: true, index: true, null: false
      t.references :rescuestation_item, foreign_key: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
