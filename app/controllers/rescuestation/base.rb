class Rescuestation::Base < ApplicationController
  before_action :authorize

  private def authorize
    unless current_rescuer_member
      flash.alert = '救援者としてログインしてください。'
      redirect_to root_url
    end
  end
end