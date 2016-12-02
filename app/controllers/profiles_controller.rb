class ProfilesController < ApplicationController
  def show
    @profile = current_user
    @booked_offers = @profile.booked_offers
    @bookings = @profile.bookings
    @all_bookings = (@booked_offers).zip(@bookings).flatten.sort { |a,b| b.date <=> a.date }
  end
end
