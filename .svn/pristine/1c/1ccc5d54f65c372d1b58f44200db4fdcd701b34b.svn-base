class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :birthdate, :datetime
    add_column :users, :address, :text
    add_column :users, :gender, :boolean
    add_column :users, :phone, :string
    add_column :users, :key, :string
    add_column :users, :status, :string, default: 'Pending'
  end
end
