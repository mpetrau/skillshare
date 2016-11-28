class BookingsController < ApplicationController
  before_action :find_offer, only: [:create]

  def create
    booking = @offer.bookings.new(booking_params)
    if booking.save
      # at later time this will instead redirect to the list of all bookings
      # at later time also need to add mailer to confirm a booking
      render @offer
    else
      render @offer
    end
  end

  private

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:week)
  end
end
