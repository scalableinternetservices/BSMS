class RemoveAmenitiesColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :listings, :amenities
  end
end
