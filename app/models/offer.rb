class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings

  SKILLS_CATS = %w(Cooking Photography Paragliding Programming Jogging)
  SENIORITY = %w(new junior experienced advanced expert)
  LOCATIONS = %w(Barcelona Madrid Valencia Malaga)

end
