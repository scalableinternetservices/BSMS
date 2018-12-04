class ListingRequestController < ApplicationController
  before_action :authenticate_user!

  caches_action :show_for_listing, :show_requests_to_me, :show_my_requests

  def new
    @user = current_user
    @listing = Listing.find(params[:listing_id])
    @listing_request = ListingRequest.new
    if not @listing.available
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't request an unavailable listing!"
    end
    if @user.id == @listing.user_id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't request your own listing!"
    end
  end

  def create
    @user = current_user
    @listing = Listing.find(listing_request_params[:listing_id])
    if not @listing.available
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't request an unavailable listing!"
    end
    if @user.id == @listing.user_id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't request your own listing!"
    end
    @listing_request = ListingRequest.new(listing_request_params)
    if @listing_request.valid?
      @listing_request.save
      @listing.listing_requests << @listing_request
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "Successfully requested listing"
    else
      render :new
    end
  rescue => e
    @listing_request = ListingRequest.new
    flash.now[:notice] = e
    render :new
  end

  def show_for_listing
    @listing = Listing.find(params[:listing_id])
    @listing_requests = @listing.listing_requests
    if @listing.user_id != current_user.id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "Can't see listing requests for a listing you don't own!"
    end
  end

  def show_requests_to_me
    @user = current_user
    @my_listings = @user.listings
  end

  def show_my_requests
    @user = current_user
    @listing_requests = ListingRequest.where(subleaser_id: @user.id)
  end

  def destroy
    @listing_request = ListingRequest.find(params[:listing_request_id])
    if @listing_request.subleaser_id != current_user.id
      redirect_to users_show_path(:id => current_user.id), :notice => "You cannot delete a listing request you did not request!"
    else
      @listing.destroy
      redirect_to users_show_path(:id => current_user.id), :notice => "Successfully deleted listing request"
    end
  end

  def listing_request_params
    params.require(:listing_request).permit(:request_message,
                                    :listing_id,
                                    :subleaser_id)
  end

end
