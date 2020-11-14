class TweetsController < ApplicationController
  before_action :require_login, only:[:new, :create, :edit, :update, :destroy, :show]
  before_action :correct_user, only:[:edit, :update, :destroy]
  before_action :require_fill_profile, only:[:new, :create,:edit, :update, :destroy]

  def index
    @tweets= Tweet.page(params[:page]).search(params[:search]).order(updated_at: :desc)
  end
  
  def new
    @tweet= Tweet.new
  end

  def create
    @tweet = Tweet.new(tweets_params)
    respond_to do |format|
      if @tweet.save
        format.html {redirect_to tweets_path, notice: '投稿しました'}
      else
        format.html {render 'new'}
      end
    end
  end
  

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments
    if @tweet.user_id != current_user.id
      if Like.exists?
        @like = Like.where(user_id: current_user.id, tweet_id: @tweet.id)
      end
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      if @tweet.update(tweets_params)
        format.html {redirect_to tweet_path(params[:id])}
        flash[:notice] = '変更しました'
      else
        format.html{render 'edit'}
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to tweets_path
      flash[:success] = '削除しました'
    end
  end

  private 
  def tweets_params
    params.require(:tweet).permit(:title,:text).merge(user_id: current_user.id)
  end

  def require_login
    unless logged_in?
      flash.now[:error] = "ログインしてください"
      redirect_to login_path
    end
  end

  def correct_user
    @tweet = Tweet.find(params[:id])
    unless current_user.id == @tweet.user_id
      redirect_to tweets_path
    end
  end
end
