class HomeController < ApplicationController
 
  def index
    if not mobile_device?
      @products = Product.order(:category_id).page(params[:page])
      @categories = Category.all
      respond_to do |format|
        format.js
        format.html
      end
    else
       @categories = Category.order(:name)
    end
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
    products = Product.search(params[:key]) if params[:key].present?
    if products
      cate_id = products.map{|c| c.category_id}.uniq
      @category = Category.where(id: [cate_id])
      min_max = []
      products.each do |p|
        p.sale_price ? min_max << p.sale_price : min_max << p.price
      end
      @min = min_max.min
      @max = min_max.max
      @r_min = products.map{|p| p.avg_rating}.min
      @r_max = products.map{|p| p.avg_rating}.max
    end
    
    products = products.where(category_id: params[:category].to_i) if params[:category].present?
    products = products.where("price BETWEEN #{params[:price].partition(',').first.to_i} AND #{params[:price].partition(',').last.to_i}") if params[:price].present?
    products = products.where("avg_rating BETWEEN #{params[:rating].partition(',').first.to_f} AND #{params[:rating].partition(',').last.to_f}") if params[:rating].present?
    @products = products.page(params[:page])
    
  end
  
  def typeahead
    product = Product.pluck(:name)
    render json: product
  end
end
