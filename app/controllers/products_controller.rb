class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @wishlist = Wishlist.where(user_id: current_user)
    @comments = Comment.where(product_id: params[:id])
    if user_signed_in?
      @checkproductwishlist = Wishlist.CheckProductWishlist(current_user.id, params[:id])
    end
  end
end