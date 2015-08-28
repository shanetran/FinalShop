module ApplicationHelper
  def show_rate_product(product)
    Comment.where(product_id: product).average(:rate).to_f
  end
  
  def user_liked(user, product)
    Like.find_by_user_id_and_product_id(user, product)
  end

end
