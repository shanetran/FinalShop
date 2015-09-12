class AddIndexSlug < ActiveRecord::Migration
  def change
    add_index :products, :slug, unique: true
  end
end
