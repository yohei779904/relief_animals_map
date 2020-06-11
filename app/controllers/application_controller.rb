class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  layout :set_layout

  private def set_layout
    # 『 params[:controller] 』で現在選択されているコントローラの名前を取得する。
    # 『match』で、レシーバ（すなわちURLパス）がその正規表現と合致するかどうかを調べる。
    if params[:controller].match(%r{\A(supporter|rescuestation|item)/})
    # 正規表現に含まれる1番目の括弧で囲まれた部分にマッチした文字列を返す。
      Regexp.last_match[1]
    else
      'supporter'
    end
  end
end

