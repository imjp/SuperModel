Supermodel::Application.routes.draw do
	get "home/index"

	resources :users do
		resources :portfolios
	end
	
	root :to => 'users#index'
	match '/' => redirect('/users')
	match '/:id' => 'users#show' 
	

end
