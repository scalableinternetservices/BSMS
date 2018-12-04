class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :listing_reviews, dependent: :destroy
	has_many :listing_requests, dependent: :destroy
	has_one :listing_contract, dependent: :destroy
	validates :user_id, presence: true
	paginates_per 10

	def average_rating
		Rails.cache.fetch("#{cache_key}/average_rating", expires_in: 12.hours) do
			if self.listing_reviews.size > 0
				self.listing_reviews.average(:rating)
			else
				''
			end
		end
	end

	def avg_rating
		Rails.cache.fetch("#{cache_key}/avg_rating", expires_in: 12.hours) do
			if self.listing_reviews.size > 0
				self.listing_reviews.average(:rating)
			else
				0
			end
		end
	end

	def readable_title
		Rails.cache.fetch("#{cache_key}/readable_title", expires_in: 12.hours) do
			if self.title
				self.title
			else
				'Home in ' + self.location
			end
		end
	end
end
