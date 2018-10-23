class ListingController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def show_mine
    @user = current_user
    @listing = Listing.where(user_id: @user.id)
  end

  def new
    @listing = Listing.new
  end

  def create
    @user = current_user
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.save
    @user.listings << @listing
    redirect_to listing_show_mine_path
  end

  private

  def listing_params
    params.require(:listing).permit(:location,
                                        :price,
                                        :duration,
                                        :amenities,
                                        :housing_type,
                                        :description)
  end
end
