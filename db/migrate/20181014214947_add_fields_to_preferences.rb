class AddFieldsToPreferences < ActiveRecord::Migration[5.0]
  def change
  	add_column :preferences, :bathrooms, :integer
  	add_column :preferences, :gym, :boolean
  	add_column :preferences, :pet_friendly, :boolean
  	add_column :preferences, :ac, :boolean
  	add_column :preferences, :heater, :boolean
  	add_column :preferences, :wifi, :boolean
  	add_column :preferences, :wash_and_dry, :boolean
  	add_column :preferences, :yard, :boolean
  	add_column :preferences, :public_transportation, :boolean

  end
end
