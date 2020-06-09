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

  def edit
    @support_member = SupportMember.find(params[:id])
  end

  def update
    @support_member = SupportMember.find(params[:id])
    
    if @support_member.update_attributes(edit_support_member_params)
      flash.notice = '救援者情報を編集しました。'
      redirect_to :supporter_support_member
    else
      flash.now.alert = '登録情報の編集に失敗しました。'
      render :edit
    end
  end

  private

  def support_member_params
    params.permit(
      :url, :name, :name_kana,
      :email, :password, :password_confirmation
    )
  end

  def edit_support_member_params
    params.permit(
      :url, :name, :name_kana,:email
    )
  end
end
