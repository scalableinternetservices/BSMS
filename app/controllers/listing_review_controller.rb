class ListingReviewController < ApplicationController
  before_action :authenticate_user!

  def new
    @listing = Listing.find(params[:listing_id])
    @listing_review = ListingReview.new
  end

  def create
    @user = current_user
    @listing = Listing.find(listing_review_params[:listing_id])
    @listing_review = ListingReview.new(listing_review_params)
    @listing_review.save
    @listing.listing_reviews << @listing_review
    redirect_to listing_show_path(:listing_id => listing_review_params[:listing_id])
  end

  private

  def listing_review_params
    params.require(:listing_review).permit(:rating,
                                    :review,
                                    :listing_id,
                                    :user_id)
  end
end
