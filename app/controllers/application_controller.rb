class ApplicationController < ActionController::Base
    include SessionsHelper
    private
    def logged_in_user
        unless logged_in?
            redirect_to login_path
        end
    end

    def require_login
        unless logged_in?
            flash.now[:error] = "ログインしてください"
            redirect_to login_path
        end
    end

    def require_fill_profile
        if current_user.profile.blank?
            redirect_to new_profile_path
        end
    end
        
end
