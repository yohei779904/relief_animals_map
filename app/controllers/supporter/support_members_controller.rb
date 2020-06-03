class Supporter::SupportMembersController < Supporter::Base
  before_action :authorize, except:[:new, :create]

  def show
    @support_member = SupportMember.find(params[:id])
  end

  def new
    @support_member = SupportMember.new
  end

  def create
    @support_member = SupportMember.new(support_member_params)

    if @support_member.save
      flash.notice = 'アカウントを新規登録しました。'
      redirect_to root_url
    else
      flash.now.alert = '新規アカウントの登録に失敗しました。'
      render :new
    end
  end

  private

  def support_member_params
    params.permit(
      :url, :lastname, :firstname, :lastname_kana,
      :firstname_kana, :email, :password, :password_confirmation
    )
  end
end
