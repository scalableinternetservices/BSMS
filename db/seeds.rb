# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User parameters
names = ["Jack", "Max", "Allison", "Tommy", "Rebecca", "Alex", "Jessica", "Michael", "Kevin", "Henry", "Saurabh"]
password = "seedaccount"

# Listing parameters
titles = ["Nice place available for rent!", "Beautiful home available", "House for rent in great location", "Amazing location with view",
					"Quiet and quaint house", "House on the hill: Gorgeous Mountain Views"]
locations = ["Fremont", "San Francisco", "Santa Barbara", "Los Angeles", "New York", "Palo Alto", "Saratoga",
	"Long Beach", "Orange County", "Venice", "San Diego", "Santa Monica", "Berkeley", "Pleasanton", "La Canada", "Thousand Oaks"]
prices = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
housing_types = ["Home", "Condo", "Apartment"]
descriptions = ["Beautiful place in great location!", "Small and cozy place perfect for 1 or 2 people",
 "Extremely spacious and in a beatufiul city!", "Located in a safe and quiet neighborhood"]
bedrooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
bathrooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
parking = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
start_date = ["2015-11-03", "2015-11-15", "2015-12-30", "2015-10-23"]
end_date = ["2016-11-03", "2017-11-15", "2016-12-30", "2016-10-23"]
random_bool = [true, false]

for i in 1..11 do
	email = "email" + i.to_s + "@bsms.com"
	user = User.create(email: email, name: names.sample, password: password)

	preferences = Preferences.create(
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
		parking: parking.sample,
		price: prices.sample
	)

	user.preferences = preferences

	for j in 1..11 do
		listing = Listing.create(
			title: titles.sample,
			location: locations.sample,
			price: prices.sample,
			start_date: start_date.sample,
			end_date: end_date.sample,
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
			parking: parking.sample,
			description: descriptions.sample,
			available: true
		)
		user.listings << listing
	end
end
