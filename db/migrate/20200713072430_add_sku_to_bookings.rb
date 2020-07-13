class AddSkuToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :sku, :string
  end
end
