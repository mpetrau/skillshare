class RemoveWeekFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :week, :integer
  end
end
