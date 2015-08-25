class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @wishlist = Wishlist.where(user_id: current_user)
  end
end