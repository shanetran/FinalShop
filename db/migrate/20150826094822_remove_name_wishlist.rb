class RemoveNameWishlist < ActiveRecord::Migration
  def change
    remove_column :wishlists, :name
  end
end
