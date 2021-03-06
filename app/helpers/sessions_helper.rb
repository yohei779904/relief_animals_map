module SessionsHelper
  
  def current_support_member
    if session[:support_member_id]
      @current_support_member ||= SupportMember.find_by(id: session[:support_member_id])
    end
  end

  def sp_logged_in?
    !!current_support_member
  end

  def current_rescuer_member
    if session[:rescuer_member_id]
      @current_rescuer_member ||= RescuerMember.find_by(id: session[:rescuer_member_id])
    end
  end

  def rs_logged_in?
    !!current_rescuer_member
  end

  def two_permits
    unless  current_support_member || current_rescuer_member
      flash.alert = '支援者または救援者としてログインしてください。'
      redirect_to root_url
    end
  end

end