class PasswordResetsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by_email(params[:email])
		user.send_password_reset if user
		redirect_to root_url, :notice => 'An email has been sent with password reset instructions.'
	end
	
	def edit
		@user = User.find_by_password_reset_token!(params[:id])
	end
	
	def update
		@user = User.find_by_password_reset_token!(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to root_url, :notice => "Password has been reset!"
		else
			render :edit, :alert => "Penis"
		end
	end
end
