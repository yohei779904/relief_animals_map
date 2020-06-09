class Rescuestation::RescuerMembersController < Rescuestation::Base
  before_action :authorize, except:[:new, :create, :index]
  before_action :two_permits, only:[:index]

  def index
    @rescuer_members = RescuerMember.all.page(params[:page]).per(6)
  end

  def show
    @rescuer_member = RescuerMember.find(params[:id])
  end

  def new
    @rescuer_member = RescuerMember.new
  end

  def create
    @rescuer_member = RescuerMember.new(rescuer_member_params)

    if @rescuer_member.save
      flash.notice = 'アカウントを新規登録しました。'
      redirect_to root_url
    else
      flash.now.alert = '新規アカウントの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @rescuer_member = RescuerMember.find(params[:id])
  end

  def update
    @rescuer_member = RescuerMember.find(params[:id])
    
    if @rescuer_member.update_attributes(edit_rescuer_member_params)
      flash.notice = '救援者情報を編集しました。'
      redirect_to :rescuestation_rescuer_member
    else
      flash.now.alert = '登録情報の編集に失敗しました。'
      render :edit
    end
  end

  
  private

  def rescuer_member_params
    params.permit(
      :url, :rescue_station, :rescue_station_kana, :representative,
      :representative_kana, :email, :phone_number,
      :post_code, :home_address, :password, :password_confirmation
    )
  end

  def edit_rescuer_member_params
    params.permit(
      :url, :rescue_station, :rescue_station_kana, :representative,
      :representative_kana, :email, :phone_number,
      :post_code, :home_address, :comment
    )
  end
end