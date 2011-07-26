class ApplicationController < ActionController::Base
	protect_from_forgery 
	helper_method :current_user
	
	private
	def current_user
		@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end
	
	def authenticate_user!
		if current_user.nil?
			redirect_to login_url, :alert => "You must first log in to access this page"
		end
	end
end
