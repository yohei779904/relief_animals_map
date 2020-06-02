class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :code # 楽天ID
      t.string :name # 商品名
      t.string :url # 商品のURL
      t.string :image_url # 商品画像のURL

      t.timestamps
    end
  end
end
