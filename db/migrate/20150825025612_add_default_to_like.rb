class AddDefaultToLike < ActiveRecord::Migration
  def change
    change_column :likes, :value, :boolean, :default => false
  end
end
