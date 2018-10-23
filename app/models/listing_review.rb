class ListingReview < ActiveRecord::Base
	belongs_to :listing
	validates :listing_id, presence: true
end
