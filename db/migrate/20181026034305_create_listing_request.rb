class CreateListingRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_requests do |t|
      t.string :listing_id
      t.string :subleaser_id
      t.string :request_message
    end
  end
end
