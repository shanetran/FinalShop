class CreateBillAddress < ActiveRecord::Migration
  def change
    create_table :bill_addresses do |t|
      t.string :fullname
      t.string :email
      t.text :address
      t.string :phone
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
