class FixTutorBookingsColumn < ActiveRecord::Migration[6.0]
  def change
    change_table :bookings do |t|
      t.rename :tutor, :tutor_id
    end
  end
end
