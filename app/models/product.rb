class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image, styles: {small: "100x100!", medium: "300x150!", large: "400x400!"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
