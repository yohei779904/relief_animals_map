class RescuestationItemsController < ApplicationController
  def dashboard
    @rescuer_member = RescuerMember.find(params[:id])
    @rescuer_member_items = @rescuer_member.items.all
  end

  def create
    # 「Item.find_by」 して見つかればテーブルに保存されていたインスタンスを返し、
    # 見つからなければ 「Item.new」 して新規作成する。
    @item = Item.find_or_initialize_by(code: params[:item_code])

    # @item が保存されていない場合、
    unless @item.persisted?
      # 先に @item を保存する
      results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)

      @item = Item.new(read(results.first))
      @item.save
    end

    # Want 関係として保存
    if params[:type] == 'Want'
      current_rescuer_member.want(@item)
      flash.notice = '商品を Want しました。'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])

    if params[:type] == 'Want'
      current_rescuer_member.unwant(@item) 
      flash.now.alert = '商品の Want を解除しました。'
    end

    redirect_back(fallback_location: root_path)
  end
end
