class RemoveUserFromVisitor < ActiveRecord::Migration
  def change
    remove_column :visitors, :user_id
  end
end
