class FixSenderMessagesColumnName < ActiveRecord::Migration[6.0]
  def change
    change_table :messages do |t|
      t.rename :sender, :sender_id
    end
  end
end
