class Rescuestation::RescuerMembersController < Rescuestation::Base

  def index
    @rescuer_members = RescuerMember.all
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
    
    if @rescuer_member.update_attributes(rescuer_member_params)
      flash[:success] = '登録情報を編集しました。'
      redirect_to :rescuestation_rescuer_member
    else
      flash.now[:danger] = '登録情報の編集に失敗しました。'
      render :edit
    end
  end

  
  private

  def rescuer_member_params
    params.permit(
      :url, :rescue_station_name, :rescue_station_name_kana, :representative,
      :representative_lastname_kana, :representative_firstname_kana, :email,
      :phone_number, :post_code, :home_address, :password, :password_confirmation
    )
  end
end