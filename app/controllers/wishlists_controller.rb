class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.where(user_id: current_user.id)
  end

  def add_product
    if Wishlist.create!(user_id: current_user.id, product_id: params[:wishlists][:product_id],
    name: params[:wishlists][:name]).valid?
      flash[:success] = "Add product to wishlist complete."
      redirect_to :back
    else
      flash[:error] = "Add product to wishlist fail."
      redirect_to :back
    end
  end
end