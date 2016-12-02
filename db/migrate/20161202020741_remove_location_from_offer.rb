class RemoveLocationFromOffer < ActiveRecord::Migration[5.0]
  def change
    remove_column :offers, :location, :string
  end
end
