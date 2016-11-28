class OffersController < ApplicationController
  def index
    @category = params["/"]["category"]
    @location = params["/"]["location"]
    @offers = Offer.where(["category = ? and location = ?", @category, @location])
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
  end
end
