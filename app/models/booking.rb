class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :week, presence: true
  validates :user, presence: true
  validates :offer, presence: true
end
