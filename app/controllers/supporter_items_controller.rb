class SupporterItemsController < ApplicationController
  def dashboard
    @supporter_item = RescuestationItem.find(params[:id])
    @supporter_items = @supporter_items.type.all
  end
end
