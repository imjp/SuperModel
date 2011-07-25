class ContactInfosController < ApplicationController
	def update
		@user = User.find(params[:user_id]) 
		@contact_info = @user.contact_info.update_attributes(params[:contact_info])
		redirect_to user_path(@user)
	end
	
	def show
		@user = User.find(params[:user_id])
		@contact_info = @user.contact_info 
	end
end