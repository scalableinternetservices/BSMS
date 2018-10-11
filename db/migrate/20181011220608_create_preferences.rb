class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.integer :bedrooms
      t.integer :parking
      t.integer :price
      t.string :weather
      t.integer :user_id
    end
  end
end
