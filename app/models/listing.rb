class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :listing_reviews, dependent: :destroy
	has_many :listing_requests, dependent: :destroy
	has_one :listing_contract, dependent: :destroy
	validates :user_id, presence: true
	paginates_per 10000

	def average_rating
		if self.listing_reviews.size > 0
			self.listing_reviews.average(:rating)
		else
			''
		end
	end

	def avg_rating
		if self.listing_reviews.size > 0
			self.listing_reviews.average(:rating)
		else
			0
		end
	end

	def readable_title
		if self.title
			self.title
		else
			'Home in ' + self.location
		end
	end
end
