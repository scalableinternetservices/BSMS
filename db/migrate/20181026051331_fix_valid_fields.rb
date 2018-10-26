class FixValidFields < ActiveRecord::Migration[5.0]
  def change
  	remove_column :listing_reviews, :valid
  	remove_column :listing_contracts, :valid
  	add_column :listing_requests, :expired, :boolean, :null => false, :default => false
  	add_column :listing_contracts, :expired, :boolean, :null => false, :default => false 
  end
end
