class ProductsController < ApplicationController
  def index
    @products = Product.order(:category_id).page(params[:page])
  end

  def show
    @title_page = Product.find(params[:id]).name
    @product = Product.find(params[:id])
    @wishlist = Wishlist.where(user_id: current_user)
    @comments = Comment.where(product_id: params[:id])
    @rate = Comment.where(product_id: params[:id]).average(:rate).to_f
    @like = Like.where(product_id: params[:id], value: true).count
    @unlike = Like.where(product_id: params[:id], value: false).count

    if params[:controller] == "products" && params[:action] == "show"
      if Visitor.verify_nil(params[:id])
        count = Visitor.find_by_product_id(params[:id])
        Visitor.update_value(params[:id], (count.value + 1))
      else
        Visitor.add_value(params[:id], 1)
      end
    end
    if user_signed_in?
      @checkproductwishlist = Wishlist.CheckProductWishlist(current_user.id, params[:id])
    end

  end
end