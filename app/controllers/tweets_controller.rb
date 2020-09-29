class TweetsController < ApplicationController
  def index
    @tweet= Tweet.all
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

  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      if @tweet.update(tweets_params)
        format.html {redirect_to tweet_path(params[:id], notice: '変更しました')}
      else
        format.html{render 'edit'}
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to tweets_path
    end
  end

  private 
  def tweets_params
    params.require(:tweet).permit(:title,:text)
  end

  
end
