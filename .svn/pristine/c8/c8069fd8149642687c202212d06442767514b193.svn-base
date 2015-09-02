module Admin
  class ProductsController < ApplicationController
    def index
      @products = Product.order(:name).page(params[:page])
    end

    def new
      @products = Product.new
    end

    def create
      product = Product.new(products_params)
      if product.save
        Product.find(product.id).update(slug: product.name.parameterize)
        flash[:success]= "Add New product complete."
        redirect_to admin_products_path
      else
        flash[:error]= "Add New product fail !!!"
        redirect_to new_admin_product_path
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      if Product.find(params[:id]).update(products_params)
        flash[:success]= "Update product complete."
        redirect_to admin_products_path
      else
        flash[:error]= "Update Product fail !!!"
        render "edit"
      end
    end

    def destroy
      Product.find(params[:id]).destroy
      flash[:success]="Delete product complete."
      redirect_to admin_products_path
    end

    private

    def products_params
      params.require(:products).permit(:name, :description, :type, :stock, :price, :image, :slug)
    end

  end
end