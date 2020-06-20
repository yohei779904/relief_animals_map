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
        hits: 30, # 30件検索。
      })

      results.each do |result|
        # 全ての検索結果を保存はダメなので、扱い易いようにitemとしてインスタンスを作成。（この時は、まだ保存はしない。）
        item = Item.find_or_initialize_by(read(result)) # application_controllerにて定義。
        # 下記でitem を [] に追加。
        @items << item
      end

      if @items.present?
        @items = Kaminari.paginate_array(@items).page(params[:page]).per(12)
      end
    end
  end
end
