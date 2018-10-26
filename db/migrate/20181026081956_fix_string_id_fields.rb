class FixStringIdFields < ActiveRecord::Migration[5.0]
  def change
  	change_column :listing_contracts, :listing_id, :integer
  	change_column :listing_contracts, :subleaser_id, :integer
  	change_column :listing_contracts, :subletter_id, :integer
  	change_column :listing_requests, :listing_id, :integer
  	change_column :listing_requests, :subleaser_id, :integer
  end
end
