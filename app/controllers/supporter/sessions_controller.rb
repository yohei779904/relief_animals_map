class Supporter::SessionsController < Supporter::Base
   skip_before_action :authorize
   
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash.notice = 'ログインしました。'
      redirect_to rescuestation_rescuer_members_path
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render 'new'
    end
  end

  def destroy
    session.delete(:support_member_id)
    flash.notice = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    @support_member = SupportMember.find_by(email: email)
    if @support_member && @support_member.authenticate(password)
      # ログイン成功
      session[:support_member_id] = @support_member.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
