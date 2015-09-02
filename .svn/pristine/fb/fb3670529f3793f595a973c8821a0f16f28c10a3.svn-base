class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: params[:id]).page(params[:page])
  end
end
