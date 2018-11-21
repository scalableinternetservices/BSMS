class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  helper_method :preference_score

  def preference_score(listing, preferences)
  	score = 0
  	if preferences.bedrooms <= listing.bedrooms
  		score += 1
  		if preferences.bedrooms == listing.bedrooms
  			score += 1
  		end
  	end
  	if preferences.parking == listing.parking
  		score += 1
  		if preferences.parking == listing.parking
  			score += 1
  		end
  	end
  	if preferences.price and preferences.price >= listing.price
  		score += 3
  	end
  	if preferences.bathrooms <= listing.bathrooms
  		score += 1
  		if preferences.bathrooms == listing.bathrooms
  			score += 1
  		end
  	end
  	if preferences.gym == listing.gym
  		score += 1
  	end
  	if preferences.pet_friendly == listing.pet_friendly
  		score += 1
  		if preferences.pet_friendly == true
  			score += 2
  		end
  	end
  	if preferences.ac == listing.ac
  		score += 1
  	end
  	if preferences.heater == listing.heater
  		score += 1
  	end
  	if preferences.wifi == listing.wifi
  		score += 1
  	end
  	if preferences.yard == listing.yard
  		score += 1
  	end
  	if preferences.wash_and_dry == listing.wash_and_dry
  		score += 1
  	end
  	if preferences.public_transportation == listing.public_transportation
  		score += 1
  	end
  	score
  end

  protected
  	def after_sign_in_path_for(resource)
  		listing_index_path
  	end
end
