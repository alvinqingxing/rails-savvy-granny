class RemoveSenderFromMessages < ActiveRecord::Migration[6.0]
  def change
    change_table :messages do |t|
      t.remove :sender
    end
  end
end
