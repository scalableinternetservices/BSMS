class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :bedrooms
      t.integer :price
      t.string :weather
      t.integer :parking

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :preferences, [:user_id, :created_at]
  end
end