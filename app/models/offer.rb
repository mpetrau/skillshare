class Offer < ApplicationRecord

  SKILLS_CATS = %w(Cooking Photography Paragliding Programming Jogging)
  SENIORITY = %w(new junior experienced advanced expert)
  LOCATIONS = %w(Barcelona Madrid Valencia Malaga)

  belongs_to :user
  has_many :bookings
  # before_destroy :check_for_bookings
  validates :user, :price, :title, :description, :seniority, :category, :location, presence: true
  validates :price, numericality: { only_integer: true }
  validates_inclusion_of :seniority, in: SENIORITY
  validates_inclusion_of :category, in: SKILLS_CATS

  def charge_commission
    (self.price * commission_fee).round(1)
  end

  def charge_price
    total_price
  end

  private

  # def check_for_bookings
  #   unless bookings.nil?
  #     flash[:warning] = "Cannot delete offer when bookings are still pending, pleas cancel your bookings first"
  #   end
  # end

  def commission_fee
    0.1
  end

  def total_price
    (self.price * (1+commission_fee)).round(1)
  end

end
