class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  layout :set_layout

  private def set_layout
    # 『 params[:controller] 』で現在選択されているコントローラの名前を取得する。
    # 『match』で、レシーバ（すなわちURLパス）がその正規表現と合致するかどうかを調べる。
    if params[:controller].match(%r{\A(supporter|rescuestation|)/})
    # 正規表現に含まれる1番目の括弧で囲まれた部分にマッチした文字列を返す。
      Regexp.last_match[1]
    else
      'application'
    end
  end

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

