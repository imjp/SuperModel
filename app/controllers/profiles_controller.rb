class ProfilesController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@profile = @user.create_profile(params[:profile])
		redirect_to user_path(@user)
	end
	
	def show
		@user = User.find(params[:user_id])
		@profile = @user.profile 
	end
end
