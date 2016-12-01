class ReviewsController < ApplicationController
  before_action :find_offer, only: [ :new, :create ]

  def new
    @review = Review.new
  end

  def create
    @review = @offer.reviews.build(review_params)
    if @review.save
     redirect_to @offer
     flash[:notice] = "Your review was created"
   else
    flash[:warning] = "There is a mistake on your form"
    render :new
  end
end


private

def review_params
  params.require(:review).permit(:title, :description, :rating)
end
def find_offer
  @offer = Offer.find(params[:offer_id])
end
end
