class ListingController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @listings = Listing.where(available: true).page params[:page]
  end

  def show
    @listing = Listing.find(params[:listing_id])
    @listing_reviews = ListingReview.where(listing_id: params[:listing_id])
  end

  def show_mine
    @user = current_user
    @listings = Listing.where(user_id: @user.id)
  end

  def new
    @listing = Listing.new
  end

  def create
    @user = current_user
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.valid?
      @listing.save
      @user.listings << @listing
      redirect_to listing_show_mine_path
    else
      render :new
    end
  rescue => e
    @listing = Listing.new
    flash.now[:notice] = e
    render :new
  end

  def edit
    @listing = Listing.find(params[:listing_id])
    if not @listing.available
      redirect_to listing_show_mine_path, :notice => "You cannot update a listing which is already subleased"
    elsif @listing.user_id != current_user.id
      redirect_to listing_show_mine_path, :notice => "You cannot update a listing you do not own!"
    end
  end

  def update
    @listing = Listing.find(params[:listing_id])
    if not @listing.available
      redirect_to listing_show_mine_path, :notice => "You cannot update a listing which is already subleased"
    elsif @listing.user_id != current_user.id
      redirect_to listing_show_mine_path, :notice => "You cannot update a listing you do not own!"
    elsif @listing.valid?
      @listing.update(listing_params)
      redirect_to listing_show_mine_path, :notice => "Successfully updated listing"
    else
      render :edit
    end
  rescue => e
    flash.now[:notice] = e
    render :edit
  end

  def destroy
    @listing = Listing.find(params[:listing_id])
    if @listing.user_id != current_user.id
      redirect_to listing_show_mine_path, :notice => "You cannot delete a listing you do not own!"
    else
      @listing.destroy
      redirect_to listing_show_mine_path, :notice => "You have successfully deleted the listing!"
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:title,
                                    :location,
                                    :start_date,
                                    :end_date,
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
