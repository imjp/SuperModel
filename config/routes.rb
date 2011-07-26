Supermodel::Application.routes.draw do   

	get 'register' => 'users#new', :as => 'register'
	get 'login' => 'sessions#new', :as => 'login'
	get 'logout' => 'sessions#destroy', :as => 'logout' 
	
	resources :sessions, :password_resets
	resources :users, :path => '/' do
		resources :portfolios
		resources :contact_infos
	end		
	
	root :to => 'users#index' 
	match '/:id' => 'users#show' 
end
