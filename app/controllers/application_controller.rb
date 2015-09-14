class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :active_account_after_sign_up_complete, :only => [:index, :show, :edit, :create, :active_complete]
  helper_method :resource, :resource_name, :devise_mapping
  helper_method :current_admin?
  helper_method :cart_count
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :fullname, :birthdate, :address, :gender, :phone, :role) }
  end

  private

  def cart_count
    if session[:cart]
      @carts = session[:cart]
    else
      @carts = {}
    end
  end

  def current_admin?
    if user_signed_in?
      current_user.is_admin?
    end
  end

  def active_account_after_sign_up_complete
    if user_signed_in?
      if current_user.status == "Pending"
        flash[:info] = "You Need to Acctive Account Now To Vistit Website."
        redirect_to active_account_home_path
      end
    end
  end
end
