class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def update
    user_fullname =params[:users][:fullname]
    user_address=params[:users][:address]
    user_phone=params[:users][:phone]

    billAdd_fullname = params[:bills][:fullname]
    billAdd_address=params[:bills][:address]
    billAdd_email = params[:bills][:email]
    billAdd_phone=params[:bills][:phone]

    user = User.find(params[:id]).update(fullname: user_fullname, address: user_address, phone: user_phone)
    bill = Bill.create!(fullname: billAdd_fullname, email: billAdd_email, address: billAdd_address,
                                phone: billAdd_phone, user_id: current_user.id)
    
    if user && bill
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
end