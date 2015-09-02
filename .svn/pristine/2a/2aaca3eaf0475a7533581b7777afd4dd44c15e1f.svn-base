class LikesController < ApplicationController
  include ApplicationHelper
  def like
    user = params[:user_id]
    product = params[:product_id]
    if user_liked(user, product).nil?
      data =  Like.create!(user_id: user, product_id: product, value: true)
    else
      data =  Like.find_by_user_id_and_product_id(user, product).update(value: true)
    end
    render json: data
  end

  def unlike
    user = params[:user_id]
    product= params[:product_id]
    if user_liked(user, product).nil?
      data =  Like.create!(user_id: user, product_id: product, value: false)
    else
      data =  Like.find_by_user_id_and_product_id(user, product).update(value: false)
    end
    render json: data
  end
end