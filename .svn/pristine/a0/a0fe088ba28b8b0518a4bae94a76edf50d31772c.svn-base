module ApplicationHelper
  def show_rate_product(product)
    Comment.where(product_id: product).average(:rate).to_f
  end
  
  def user_liked(user, product)
    Like.find_by_user_id_and_product_id(user, product)
  end
  
  def count_liked(product)
    Like.where(product_id: product, value: true).count
  end
  
  def count_disliked(product)
    Like.where(product_id: product, value: false).count
  end
  
  def format_price(price)
    number_with_precision(price, :precision => 0, :delimiter => ',')
  end
  
  def percent_price(sale, price)
     number_to_percentage((100 - ((sale * 100) / price)).to_i, precision: 0)
  end

end
