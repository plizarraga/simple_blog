class ApplicationController < ActionController::Base

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    def require_login
        redirect_to new_login_path unless current_user
    end
end
