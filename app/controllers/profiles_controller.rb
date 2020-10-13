class ProfilesController < ApplicationController
  before_action :require_login
  before_action :correct_user, only:[:edit, :update]
  before_action :require_fill_profile, only:[:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to tweets_path
    else
      render 'new'
    end
  end


  def search
    @search_params = profile_search_params
    @profiles = Profile.search(@search_params)
  end

  def show
    @profile = Profile.find(params[:id])
    @tweets = @profile.user.tweets

    @user = @profile.user
    unless current_user == @user
      @userRoom = Room.find_by(:user_id=> current_user.id,:receiver_id=> @user.id)
      @userRoom2 = Room.find_by(:user_id=> @user.id,:receiver_id=>current_user.id)
      if @userRoom.present?
        @isRoom = true
        @roomId = @userRoom
      elsif @userRoom2.present?
        @isRoom = true
        @roomId = @userRoom2
      else
        @room = Room.new(user_id:current_user.id, receiver_id: @user.id)
      end
    end

  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    respond_to do |format|
      if @profile.update(profile_params)
        format.html {redirect_to profile_path(params[:id], notice: '変更しました')}
      else
        format.html{render 'edit'}
      end
    end
  end




  private
    def profile_params
      params.require(:profile).permit(:nickname, :age, :favorite, :introduce, :image, :place, :sex,:user_id).merge(user_id:current_user.id)
    end

    def profile_search_params
      params.fetch(:search,{}).permit(:nickname_like, :favorite_like, :what_sex_is, :age_from, :age_to)
      #formに検索地がないときnil
    end

    def require_login
      unless logged_in?
        flash.now[:error] = "ログインしてください"
        redirect_to login_path
      end
    end

    def correct_user
      @profile = Profile.find(params[:id])
      unless current_user.id == @profile.user_id
        redirect_to tweets_path
      end
    end

    
end
