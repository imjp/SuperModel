class ContactInfosController < ApplicationController
	def update
		@user = User.find(params[:user_id]) 
		@contact_info = @user.contact_info.update_attributes(params[:contact_info])
		redirect_to edit_user_path(@user), notice: 'Contact Info was successfully updated.'
	end
	
	def show
		@user = User.find(params[:user_id])
		@contact_info = @user.contact_info 
	end
end