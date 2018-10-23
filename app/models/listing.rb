class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :listing_reviews, dependent: :destroy
	validates :user_id, presence: true

	def average_rating
		if self.listing_reviews.size > 0
			self.listing_reviews.average(:rating)
		else
			''
		end
	end

end
