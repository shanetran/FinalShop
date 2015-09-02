class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def update
    if User.find(params[:id]).update(checkouts_params)
      flash[:success] = "Enter information complete."
      redirect_to delivery_checkout_path(current_user)
    else
      flash[:error] = "You have a problem. Enter again."
      redirect_to :back
    end
  end
  
  def delivery
    @carts = session[:cart] ||= {}
  end
  
  private
  def checkouts_params
    params.require(:users).permit(:fullname, :email, :address, :phone)
  end
end