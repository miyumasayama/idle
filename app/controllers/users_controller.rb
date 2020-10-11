class UsersController < ApplicationController
  before_action :require_login, only: :show
  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to new_profile_path
    else
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:id])
  end


  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
