class CreateListingReview < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_reviews do |t|
      t.integer :rating
      t.string :review
      t.integer :listing_id
    end
  end
end
