class ChangeDateTypeInListing < ActiveRecord::Migration[5.0]
  def change
  	remove_column :listings, :start_date
  	remove_column :listings, :end_date
  	add_column :listings, :start_date, :string
  	add_column :listings, :end_date, :string
  end
end
