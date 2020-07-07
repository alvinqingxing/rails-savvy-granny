class RenameColumnInMessages < ActiveRecord::Migration[6.0]
  def change
    change_table :messages do |t|
      t.rename :user_id, :sender
    end
  end
end
