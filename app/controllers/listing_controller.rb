class ListingController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @listing = Listing.where(user_id: @user.id)
  end

  def new
    @listing = Listing.new
  end

  def edit
    @user = current_user
    @listing = Listing.where(user_id: @user.id).first
  end

  def update
    @user = current_user
    @listing = Listing.where(user_id: @user.id).first
    @listing.update(listing_params)
    redirect_to listing_show_path
  end

  def create
    @user = current_user
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.save
    @user.listings << @listing
    redirect_to listing_show_path
  end

  private

  def listing_params
    params.require(:listing).permit(:location,
                            :duration,
                            :housing_type,
                            :bedrooms,
                            :bathrooms,
                            :gym,
                            :pet_friendly,
                            :ac,
                            :heater,
                            :wifi,
                            :wash_and_dry,
                            :yard,
                            :public_transportation,
                            :parking,
                            :price,
                            :description)
  end
end

# :bedrooms,
#                                     :bathrooms,
#                                     :gym,
#                                     :pet_friendly,
#                                     :ac,
#                                     :heater,
#                                     :wifi,
#                                     :wash_and_dry,
#                                     :yard,
#                                     :public_transportation,
#                                     :parking,
#                                     :price
