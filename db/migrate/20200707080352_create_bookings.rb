class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.time :start_time
      t.decimal :price
      t.string :status
      t.bigint :transaction_id
      t.references :job, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :user1, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
