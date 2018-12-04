class MatchesController < ApplicationController
	before_action :authenticate_user!

	caches_action :index

  def index
  	@user = current_user
    @listings = Listing.where.not(user_id: @user.id).last(10)
    @preferences = Preferences.where(user_id: @user.id).first
		@sorted_listings = nil
		if @preferences
	    @sorted_listings = @listings.sort { |listing_a, listing_b| preference_score(listing_a, @preferences) <=> preference_score(listing_b, @preferences) }.reverse
		end
  end
end
