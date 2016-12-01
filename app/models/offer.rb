class Offer < ApplicationRecord

  SKILLS_CATS = %w(Cooking Photography Paragliding Programming Jogging)
  SENIORITY = %w(new junior experienced advanced expert)

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  # before_destroy :check_for_bookings
  validates :user, :price, :title, :description, :seniority, :category, :address, :zip_code, :city, :country, presence: true
  validates :price, numericality: { only_integer: true }
  validates_inclusion_of :seniority, in: SENIORITY
  validates_inclusion_of :category, in: SKILLS_CATS

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def charge_commission
    (self.price * commission_fee).round(1)
  end

  def charge_price
    total_price
  end

  def location
     "#{address}, #{zip_code} #{city} #{country}"
  end

  def location_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end

  def average
    stars = self.reviews.sum(:rating)
    nb_reviews = self.reviews.count
    nb_reviews = 1 if nb_reviews == 0
    stars / nb_reviews
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
