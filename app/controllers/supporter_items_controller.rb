class SupporterItemsController < ApplicationController
  def dashboard
    @supporter_item = RescuerMember.find(params[:id])
    @supporter_items = @supporter_item.items.all
  end
end
