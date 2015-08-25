module Admin
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      category = Category.new(categories_params)
      if category.save
        flash[:success]= "Add New category complete."
        redirect_to admin_categories_path
      else
        flash[:error]= "Add New category fail !!!"
        redirect_to new_admin_category_path
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      if Category.find(params[:id]).update(categories_params)
        flash[:success]= "Update category complete."
        redirect_to admin_categories_path
      else
        flash[:error]= "Update Product fail !!!"
        render "edit"
      end
    end

    def destroy
      Category.find(params[:id]).destroy
      flash[:success]="Delete category complete."
      redirect_to admin_categories_path
    end

    private

    def categories_params
      params.require(:categories).permit(:name)
    end

  end
end