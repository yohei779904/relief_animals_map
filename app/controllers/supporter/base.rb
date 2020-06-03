class Supporter::Base < ApplicationController
  before_action :authorize
  before_action :check_timeout

  private def authorize
    unless current_support_member
      flash.alert = '支援者としてログインしてください。'
      redirect_to root_url
    end
  end

  TIMEOUT = 1.minutes
  
  private def check_timeout
    if current_support_member
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:support_member_id)
        flash.alert = '一定時間が過ぎたためタイムアウトしました。'
        redirect_to root_url
      end
    end
  end
end