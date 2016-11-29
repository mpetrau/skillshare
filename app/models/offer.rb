class Offer < ApplicationRecord
  
  SKILLS_CATS = %w(Cooking Photography Paragliding Programming Jogging)
  SENIORITY = %w(new junior experienced advanced expert)
  LOCATIONS = %w(Barcelona Madrid Valencia Malaga)

  belongs_to :user
  has_many :bookings
  before_destroy :check_for_bookings
  validates :user, :price, :title, :description, :seniority, :category, :location, presence: true
  validates :price, numericality: { only_integer: true }
  validates_inclusion_of :seniority, in: SENIORITY
  validates_inclusion_of :category, in: SKILLS_CATS
  
  private
  def check_for_bookings
    unless bookings.nil?
      flash[:warning] = "Cannot delete offer when bookings are still pending, pleas cancel your bookings first"
    end
  end

end
