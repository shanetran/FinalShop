class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
