class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :message
      t.references :user

      t.timestamps
    end
  end
end
