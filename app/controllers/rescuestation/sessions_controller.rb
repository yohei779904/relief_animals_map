class Rescuestation::SessionsController < Rescuestation::Base
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash.notice = 'ログインしました。'
      redirect_to rescuestation_rescuer_member_path(current_rescuer_member)
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
