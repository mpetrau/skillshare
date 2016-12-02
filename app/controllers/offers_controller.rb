class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @category = params["/offers"]["category"]
    @location = params["/offers"]["location"]
    # @offers = Offer.where(["category = ? and location = ?", @category, @location])
    @offers = Offer.near(@location, 10).where(["category = ?", @category])
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
    @location_hash = Gmaps4rails.build_markers(@offer) do |offer, marker|
      marker.lat offer.latitude
      marker.lng offer.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to @offer
      flash[:notice] = "Your offer was created"
    else
      flash[:warning] = "There is a mistake on your form"
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    unless current_user == @offer.user
      redirect_to root_path, alert: "No access!"
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to profile_path
  end

  private

  def offer_params
    params.require(:offer).permit([:price, :title, :description, :seniority, :category, :address, :zip_code, :city, :country])
  end
end
