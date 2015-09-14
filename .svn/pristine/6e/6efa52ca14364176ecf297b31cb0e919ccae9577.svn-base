class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.integer :value

      t.timestamps
    end
  end
end
