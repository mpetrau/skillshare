class AddAddressToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :address, :string
    add_column :offers, :zip_code, :string
    add_column :offers, :city, :string
    add_column :offers, :country, :string
  end
end
