# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User parameters
names = ["Jack", "Max", "Allison", "Tommy", "Rebecca", "Alex", "Jessica", "Michael", "Kevin"]
password = "seedaccount"

# Listing parameters
titles = ["Nice place available for rent!", "Beautiful home available", "House for rent in great location"]
locations = ["Cupertino", "Fremont", "San Francisco", "Santa Barbara", "Los Angeles", "New York", "Palo Alto", "Saratoga", 
	"Long Beach", "Orange County", "Venice", "San Diego", "Santa Monica", "Berkeley", "Pleasanton", "La Canada", "Thousand Oaks"]
prices = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
housing_types = ["house", "apartment", "condo", "townhouse"]
descriptions = ["Beautiful place in great location!", "Small and cozy place perfect for 1 or 2 people",
 "Extremely spacious and in a beatufiul city!", "Located in a safe and quiet neighborhood"]
bedrooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
bathrooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
parking_spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
start_date = "2015-11-03"
end_date = "2015-11-15"
random_bool = [true, false]

# TODO: Create Listing requests, contracts, reviews. These relations are little trickier to seed


for i in 1..100 do
	email = "email" + i.to_s + "@bsms.com"
	user = User.create(email: email, name: names.sample, password: password)

	for j in 1..5 do
		listing = Listing.create(title: titles.sample, 
			location: locations.sample, 
			price: prices.sample, 
			start_date: start_date, 
			end_date: end_date, 
			housing_type: housing_types.sample, 
			bedrooms: bedrooms.sample,
			bathrooms: bathrooms.sample,
			gym: random_bool.sample,
			pet_friendly: random_bool.sample,
			ac: random_bool.sample,
			heater: random_bool.sample,
			wifi: random_bool.sample,
			wash_and_dry: random_bool.sample,
			yard: random_bool.sample,
			public_transportation: random_bool.sample,
			description: descriptions.sample, 
			available: true)

		user.listings << listing
	end
end
