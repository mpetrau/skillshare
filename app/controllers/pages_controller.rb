class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @featured = Offer.all.sort_by(&:average).reverse.first(4)
  end
end
