class ListingController < ActionController::Base
  before_action :authenticate_user!

  def index
    @user = current_user
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
  end

  def new
    @user = current_user
    @listing = Listing.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path
  end

  def create
    @user = current_user
    @listing = Listing.new(listing_params)
    @listing.user_id = @user.id
    @listing.save
    redirect_to listing_path
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