class AddChatroomToMessages < ActiveRecord::Migration[6.0]
  def change
    change_table :messages do |t|
     t.references :chatroom, null: false, foreign_key: true
    end
  end
end
