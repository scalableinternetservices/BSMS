class ProfileController < ApplicationController
	def view_profile
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
  end
 private

  def user_params
    params.require(:user).permit(:name,
                                 :email, 
                                 :phone_number,
                                 :description,
                                 :home_town,
                                 )
  end
end
