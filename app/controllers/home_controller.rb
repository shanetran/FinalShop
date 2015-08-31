class HomeController < ApplicationController
  def index
    @products = Product.order(:category_id).page(params[:page])
    @categories = Category.all
  end

  def active
    if User.verify_key(params[:key])
      flash[:success] = "Account active complete."
      redirect_to active_complete_home_path
    else
      flash[:error] = "Account cannot active."
      redirect_to active_home_path
    end
  end

  def search
    @products = Product.search(params[:key]).page(params[:page])
  end
end
