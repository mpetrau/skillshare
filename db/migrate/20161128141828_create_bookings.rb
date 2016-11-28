class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true
      t.integer :week

      t.timestamps
    end
  end
end
