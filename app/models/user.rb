class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :offers, dependent: :destroy
  has_many :bookings
  has_many :booked_offers, through: :offers, source: :bookings
  validates :name, :picture, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def check_for_bookings
    unless bookings.nil?
      flash[:alert] = "If you do this all your offers will be destroyed, are you sure?"
    end
  end
end
