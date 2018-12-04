class ListingContractController < ApplicationController
  before_action :authenticate_user!

  caches_action :show

  def new
    @subletter_user = current_user
    @listing_request = ListingRequest.find(params[:listing_request_id])
    @listing = Listing.find(@listing_request.listing_id)
    @subleaser_user = User.find(@listing_request.subleaser_id)
    if @subleaser_user.id == @listing.user_id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't sublease your own listing!"
    elsif @subletter_user.id != @listing.user_id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't accept a listing request that isn't yours!"
    end
    @listing_contract = ListingContract.new
  end

  def create
    @subletter_user = current_user
    @listing_request = ListingRequest.find(params[:listing_request_id])
    @listing = Listing.find(@listing_request.listing_id)
    @subleaser_user = User.find(@listing_request.subleaser_id)
    if @subleaser_user.id == @listing.user_id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't sublease your own listing!"
    elsif @subletter_user.id != @listing.user_id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You can't accept a listing request that isn't yours!"
    end
    @listing_contract = ListingContract.new(listing_contract_params)
    @expiration_date = DateTime.parse(@listing.end_date)
    @listing_contract.expiration_date = @expiration_date
    if @listing_contract.valid?
      @listing_contract.save
      @listing.listing_contract = @listing_contract
      @listing.listing_requests.each do |request|
        request.update(expired: true)
      end
      @listing.update(available: false)
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "Successfully subleased out listing"
    else
      render :new
    end
  rescue => e
    @subletter_user = current_user
    @listing = Listing.find(listing_contract_params[:listing_id])
    @subleaser_user = User.find(listing_contract_params[:subleaser_id])
    @listing_contract = ListingContract.new
    flash.now[:notice] = e
    render :new
  end

  def show
    @user = current_user
    @sublease_contracts = ListingContract.where(subleaser_id: @user.id)
    @sublet_contracts = ListingContract.where(subletter_id: @user.id)
  end

  def listing_contract_params
    params.require(:listing_contract).permit(:listing_id,
                                             :subleaser_id,
                                             :subletter_id)
  end

end
