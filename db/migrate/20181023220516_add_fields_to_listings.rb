class AddFieldsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :bedrooms, :integer
    add_column :listings, :parking, :integer
    add_column :listings, :weather, :string
    add_column :listings, :bathrooms, :integer
    add_column :listings, :gym, :boolean
    add_column :listings, :pet_friendly, :boolean
    add_column :listings, :ac, :boolean
    add_column :listings, :heater, :boolean
    add_column :listings, :wifi, :boolean
    add_column :listings, :wash_and_dry, :boolean
    add_column :listings, :yard, :boolean
    add_column :listings, :public_transportation, :boolean
  end
end
