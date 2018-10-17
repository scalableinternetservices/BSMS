class LandingController < ApplicationController
  def index
  	@listings = Listing.all
  end
end
