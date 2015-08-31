class AddSlugtoProducts < ActiveRecord::Migration
  def change
    add_column :products, :slug, :text
  end
end
