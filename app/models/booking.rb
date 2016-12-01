class Booking < ApplicationRecord
  belongs_to :user
  has_one :review
  belongs_to :offer
  validates :date, presence: true
  validates :user, presence: true
  validates :offer, presence: true
end
