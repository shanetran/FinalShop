class Visitor < ActiveRecord::Base
  belongs_to :product
  
  def self.verify_nil(product)
    where(product_id: product).present?
  end
  
  def self.find_value(product)
    find_by_product_id(product).value
  end
  
  def self.add_value(product, value)
    create!(product_id: product, value: value)
  end
  
  def self.update_value(product, value)
    find_by_product_id(product).update(value: value)
  end
end
