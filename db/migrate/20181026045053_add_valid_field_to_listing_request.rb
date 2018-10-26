class AddValidFieldToListingRequest < ActiveRecord::Migration[5.0]
  def change
  	add_column :listing_reviews, :valid, :boolean, :null => false, :default => true
  end
end
