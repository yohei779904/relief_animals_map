class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :code # 商品の楽天ID
      t.string :name # 商品名
      t.string :price # 商品の値段
      t.string :url # 商品のURL
      t.string :image_url # 商品画像のURL

      t.timestamps null: false
    end
  end
end
