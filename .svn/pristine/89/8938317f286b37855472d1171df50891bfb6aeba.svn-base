module Admin
  class ApplicationController < ActionController::Base
    layout 'layouts/admin'
    before_filter :authenticate_user!
    before_filter :authenticate_admin!
    helper_method :current_admin?
    private
    def authenticate_admin!
      if user_signed_in?
        unless current_user.is_admin?
          flash[:warn] = "Your account access denied."
          redirect_to root_path
        end
      end
    end

    def current_admin?
      if user_signed_in?
        current_user.is_admin?
      end
    end

  end
end