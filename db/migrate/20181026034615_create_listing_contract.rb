class CreateListingContract < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_contracts do |t|
      t.string :listing_id
      t.string :subleaser_id
      t.string :subletter_id
      t.datetime :expiration_date
      t.boolean :valid
    end
  end
end
