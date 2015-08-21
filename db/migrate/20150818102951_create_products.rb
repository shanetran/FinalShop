class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.boolean :type
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end
