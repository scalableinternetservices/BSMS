class IndexDatabase < ActiveRecord::Migration[5.0]
  def change
  	add_index :preferences, :user_id
  	add_index :listing_reviews, :listing_id
  	add_index :listing_requests, :subleaser_id
  	add_index :listings, :user_id
  	add_index :listings, :available
  	add_index :listing_contracts, :listing_id
  	add_index :listing_contracts, :subleaser_id
  end
end
