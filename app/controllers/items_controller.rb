class ItemsController < ApplicationController

  def new
    # カラの配列を用意して初期化。Viewで@itemsにアクセスしたときにnilとなってエラーが発生するのを防ぐため。
    @items = []

    # フォームから送信される検索ワードを取得
    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1, # 画像付きのみ検索。
        hits: 20, # 20件検索。
      })

      results.each do |result|
        # 全ての検索結果を保存はダメなので、扱い易いようにitemとしてインスタンスを作成。（この時は、まだ保存はしない）
        item = Item.new(read(result))
        # 下記でitem を [] に追加。
        @items << item
      end
    end
  end

  private

  def read(result)
    code = result['itemCode']
    name = result['itemName']
    url = result['itemUrl']
    # 画像サイズ『128x128』だと小さいので、画像URL末尾に含まれる『?_ex=128x128』を削除。
    image_url = result['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128x128', '')

    {
      code: code,
      name: name,
      url: url,
      image_url: image_url,
    }
  end
end
