Supermodel::Application.routes.draw do
	get "home/index"

	resources :users do
		resources :profiles
	end
	
	root :to => 'home#index'

end
