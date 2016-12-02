class AddBookingToReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :booking, foreign_key: true
    remove_reference :reviews, :offer, foreign_key: true
  end
end
