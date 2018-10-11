class PreferencesController < ActionController::Base
	before_action :authenticate_user!

	def preferences_index
  		@preferences = current_user.preferences.all
    	@all_preferences = Preferences.all
  	end

	def show
    	@preferences = Preferences.find(params[:id])
    	@user = User.find(@preference.user_id)
	end

	def new
    	@preferences = current_user.preferences.new
  	end

  	def edit
    	@preferences = Preferences.find(params[:id])
  	end

  	def update
  		@preferences = Preferences.find(params[:id])
  		@preferences.update(preferences_params)
  		redirect_to preferences_index_path
  	end

  	def create
  		@user = current_user
    	@preferences = Preferences.new(preferences_params)
    	@preferences.save
    	redirect_to preferences_index_path
	end	

	private

	def preferences_params
		params.require(:preferences).permit(:user_id,
								:bedrooms,
	    						:price,
	    						:weather,
	    						:parking)
  	end
end