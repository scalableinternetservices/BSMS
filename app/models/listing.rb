class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :listing_reviews
	validates :user_id, presence: true
end
