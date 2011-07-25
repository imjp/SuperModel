Supermodel::Application.routes.draw do
	get "home/index"

	resources :users do
		resources :portfolios
		resources :contact_infos
	end
	
	root :to => 'users#index'
	match '/' => redirect('/users')
	match '/:id' => 'users#show' 
	

end
