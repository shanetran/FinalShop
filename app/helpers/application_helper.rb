module ApplicationHelper
  def show_rate_product(product)
    Comment.where(product_id: product).average(:rate).to_f
  end
end
