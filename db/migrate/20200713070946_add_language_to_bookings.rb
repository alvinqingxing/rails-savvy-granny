class AddLanguageToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :language, :string
  end
end
