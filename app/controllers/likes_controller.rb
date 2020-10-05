class LikesController < ApplicationController
  before_action :set_tweet, only: [:create, :destroy]
  before_action :require_login
  def index
  end

  def create
    if @tweet.user_id != current_user.id
      @like = Like.new(user_id: current_user.id, tweet_id: @tweet.id)
      @like.save
      respond_to do |format|
        format.js
      end
    else 
      redirect_back(fallbacklocation: root_path)
    end
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: @tweet.id)
    @like.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id]) 


  end

  def liked_by?(tweet_id)
    likes.where(tweet_id: @tweet.id).exists?
  end
end
