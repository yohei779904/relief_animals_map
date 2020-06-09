class Supporter::Base < ApplicationController
  before_action :authorize

  private def authorize
    unless current_support_member
      flash.alert = '支援者としてログインしてください。'
      redirect_to root_url
    end
  end
end