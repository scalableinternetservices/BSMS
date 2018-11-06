class ListingReview < ActiveRecord::Base
	belongs_to :listing
	validates :listing_id, presence: true
	acts_as_votable
	paginates_per 1
end
