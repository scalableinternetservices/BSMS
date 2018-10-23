class AddUserIdToListingReview < ActiveRecord::Migration[5.0]
  def change
  	add_column :listing_reviews, :user_id, :integer
  end
end
