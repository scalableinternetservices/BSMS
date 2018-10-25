class ChangeFieldsInListing < ActiveRecord::Migration[5.0]
  def change
  	remove_column :listings, :duration
  	add_column :listings, :start_date, :datetime
  	add_column :listings, :end_date, :datetime
  end
end
