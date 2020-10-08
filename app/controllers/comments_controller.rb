class CommentsController < ApplicationController
    before_action :require_login
    before_action :require_fill_profile

    def create
        @tweet = Tweet.find(params[:tweet_id])
        @comment = @tweet.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content,:tweet_id)
    end

    def require_login
        unless logged_in?
            flash.now[:error] = "ログインしてください"
            redirect_to login_path
        end
    end
end
