class RevertReviewsAssociation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :booking, foreign_key: true
    add_reference :reviews, :offer, foreign_key: true
  end
end
