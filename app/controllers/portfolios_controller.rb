class PortfoliosController < ApplicationController
	def update
		@user = User.find(params[:user_id]) 
		@portfolio = @user.portfolio.update_attributes(params[:portfolio])
		redirect_to user_path(@user)
	end
	
	def show
		@user = User.find(params[:user_id])
		@portfolio = @user.portfolio 
	end
end