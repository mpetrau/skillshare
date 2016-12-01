class Review < ApplicationRecord
  belongs_to :offer
  validates :title, :description, :rating, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: false }
  validates :rating, numericality: { only_integer: true }


end
