class Rescuestation::SessionsController < Rescuestation::Base
   skip_before_action :authorize
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash.notice = 'ログインしました。'
      redirect_to dashboard_rescuestation_item_path(current_rescuer_member)
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render 'new'
    end
  end

  def destroy
    session.delete(:rescuer_member_id)
    flash.notice = 'ログアウトしました。'
    redirect_to root_url
  end


  private

  def login(email, password)
    @rescuer_member = RescuerMember.find_by(email: email)
    if @rescuer_member && @rescuer_member.authenticate(password)
      # ログイン成功
      session[:rescuer_member_id] = @rescuer_member.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
