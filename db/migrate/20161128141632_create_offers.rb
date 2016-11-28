class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.string :title
      t.string :description
      t.string :seniority
      t.string :category

      t.timestamps
    end
  end
end
