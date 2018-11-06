class ChangeStringIdToIntegerIdFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :listing_contracts, :listing_id
    remove_column :listing_contracts, :subleaser_id
    remove_column :listing_contracts, :subletter_id
    remove_column :listing_requests, :listing_id
    remove_column :listing_requests, :subleaser_id
    add_column :listing_contracts, :listing_id, :integer
    add_column :listing_contracts, :subleaser_id, :integer
    add_column :listing_contracts, :subletter_id, :integer
    add_column :listing_requests, :listing_id, :integer
    add_column :listing_requests, :subleaser_id, :integer
  end
end
