class AddStatusOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, default: "Pendding"
  end
end
