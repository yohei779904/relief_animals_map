class CreateRescuestationItems < ActiveRecord::Migration[5.1]
  def change
    create_table :rescuestation_items do |t|
      t.string :type
      t.references :rescuer_member, foreign_key: true, index: true, null: false
      t.references :item, foreign_key: true, index: true, null: false

      t.timestamps null: false
    end
  end
end