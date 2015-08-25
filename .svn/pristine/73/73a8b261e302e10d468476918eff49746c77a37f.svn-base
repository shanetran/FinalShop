class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.string :name

      t.timestamps
    end
  end
end
