class DistributorsController < ApplicationController
  def show
    # id = params[:id] if params[:id].present?
    # limit = params[:limit].present? ? params[:limit] : 9
    # offset = params[:offset].present? ? params[:offset] : 0
    @distributor = User.find(params[:id]) if params[:id].present?
    @products = User.find(params[:id]).products.page(params[:page]).order(:name)
  end
end
