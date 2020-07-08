class AddStartDateToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :start_date, :date
  end
end
