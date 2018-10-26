class AddAvailableFieldToListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :available, :boolean, :null => false, :default => true
  end
end
