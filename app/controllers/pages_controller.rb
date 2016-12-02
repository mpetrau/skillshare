class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @featured = Offer.all.sort_by(&:average).reverse
    if user_signed_in?
      booked_offers = current_user.booked_offers
      bookings = current_user.bookings
      @all_bookings = (booked_offers).zip(bookings).flatten.sort { |a,b| a.created_at <=> b.created_at }.first(4)
    else
      @all_bookings = nil
    end
  end
end
