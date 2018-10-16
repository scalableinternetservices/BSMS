class CreateListing < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :location
      t.integer :price
      t.integer :duration
      t.string :amenities
      t.string :housing_type
      t.string :description
    end
  end
end
