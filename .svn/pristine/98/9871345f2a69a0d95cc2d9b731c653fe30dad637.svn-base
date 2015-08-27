class WishlistsController < ApplicationController
  def index
    @wishlist = Wishlist.where(user_id: current_user.id).map{|p| p.product_id}
    @products = Product.where(id: @wishlist).page(params[:page])
  end

  def add_product
    user_id = params[:user_id].to_i
    product_id = params[:product_id].to_i
    @data = Wishlist.create!(user_id: user_id, product_id: product_id)
    respond_to do |format|
      format.html {}
      format.json {render :json => @data}
    end
  end

  def remove_product
    user_id = params[:user_id].to_i
    product_id = params[:product_id].to_i
    @data = Wishlist.find_by_user_id_and_product_id(user_id, product_id).delete
    respond_to do |format|
      format.html {}
      format.json {render :json => @data}
    end
  end
end
