class PortfoliosController < ApplicationController
	def update
		@user = User.find(params[:user_id]) 
		@portfolio = @user.portfolio.update_attributes(params[:portfolio])
		redirect_to edit_user_path(@user), notice: 'Portfolio was successfully updated.'
	end
	
	def show
		@user = User.find(params[:user_id])
		@portfolio = @user.portfolio 
	end
end