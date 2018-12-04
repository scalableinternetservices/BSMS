class UsersController < ApplicationController
	before_action :authenticate_user!

	caches_action :show

	def show
		@user = User.find(params[:id])
		@listings = Listing.where(user_id: params[:id])
	end

	def edit_profile
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		redirect_to users_show_path(:id => current_user.id)
	end

	def user_params
		params.require(:user).permit(:name)
	end
end
