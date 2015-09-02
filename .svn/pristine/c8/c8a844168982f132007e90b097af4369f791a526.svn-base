class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    params[:orders].each do |index, order|
      Order.create!(order).valid?
    end
    session[:cart] = nil
    flash[:success] = "Create order complete."
    redirect_to complete_user_orders_path(current_user)
  end

  def complete
    @orders = Order.where(user_id: current_user.id)
  end
end