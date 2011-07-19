class ProfilesController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@profile = @user.profiles.create(params[:profile])
		redirect_to user_path(@user)
	end
end
