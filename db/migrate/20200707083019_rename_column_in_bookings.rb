class RenameColumnInBookings < ActiveRecord::Migration[6.0]
  def change
    change_table :bookings do |t|
      t.rename :user1_id, :tutor
    end
  end
end
