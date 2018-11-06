class ListingReviewController < ApplicationController
  before_action :authenticate_user!

  def new
    @listing = Listing.find(params[:listing_id])
    @listing_review = ListingReview.new
    @listing_contract = ListingContract.where(listing_id: params[:listing_id])
    if @listing_contract.size == 0
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You cannot review a listing you didn't sublease!"
    elsif @listing_contract.first.subleaser_id != current_user.id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You cannot review a listing you didn't sublease!"
    end
  end

  def upvote
    @listing_review = ListingReview.find(params[:id])
    @listing_review.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @listing_review = ListingReview.find(params[:id])
    @listing_review.downvote_by current_user
    redirect_to :back
  end

  def create
    @user = current_user
    @listing = Listing.find(listing_review_params[:listing_id])
    @listing_contract = ListingContract.where(listing_id: listing_review_params[:listing_id])
    @listing_review = ListingReview.where(listing_id: listing_review_params[:listing_id]).find(listing_review_params[:user_id])
    if @listing_contract.size == 0
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You cannot review a listing you didn't sublease!"
    elsif @listing_contract.first.subleaser_id != current_user.id
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You cannot review a listing you didn't sublease!"
    elsif !@listing_review.nil?
      redirect_to listing_show_path(:listing_id => @listing.id), :notice => "You cannot review a listing you've already reviewed!"
    else
      @listing_review = ListingReview.new(listing_review_params)
      @listing_review.save
      @listing.listing_reviews << @listing_review
      redirect_to listing_show_path(:listing_id => listing_review_params[:listing_id]), :notice => "Successfully submitted review!"
    end
  end

  private

  def listing_review_params
    params.require(:listing_review).permit(:rating,
                                    :review,
                                    :listing_id,
                                    :user_id)
  end
end
