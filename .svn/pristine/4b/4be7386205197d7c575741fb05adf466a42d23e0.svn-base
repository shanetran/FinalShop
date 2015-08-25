class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.boolean :value

      t.timestamps
    end
  end
end
