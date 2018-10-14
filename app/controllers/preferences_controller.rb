class PreferencesController < ActionController::Base
	before_action :authenticate_user!

	def show
		@user = current_user
		@preference = Preferences.where(user_id: @user.id)
	end

	def new
		@preference = Preferences.new
	end

	def edit
		@user = current_user
		@preference = Preferences.where(user_id: @user.id)
	end

	def update
		@user = current_user
		@preference = Preferences.where(user_id: @user.id)
		@preference.update(preferences_params)
		redirect_to preferences_path
	end

	def create
		@user = current_user
		@preference = Preferences.new(preferences_params)
		@preference.user_id = current_user.id
		@preference.save
		@user.preferences = @preference
		redirect_to preferences_path
	end

	private

	def preferences_params
		params.require(:preferences).permit(:bedrooms,
																				:price,
																				:weather,
																				:parking)
	end
end
