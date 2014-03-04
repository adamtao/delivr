Delivr::Application.routes.draw do

  get "admin", to: 'admin#index', as: 'admin_root'

  root :to => "home#index"
	match 'auth/:provider/callback', to: 'sessions#create', via: :all
	get 'auth/failure', to: 'sessions#failure'
	get 'signin', to: 'sessions#new', as: 'new_session'
	get 'signout', to: 'sessions#destroy', as: 'signout'

	get 'profile', to: 'profile#show', as: 'profile'
	get 'profile/edit', to: 'profile#edit', as: 'edit_profile'
	patch 'profile/update', to: 'profile#update', as: 'update_profile'

  resources :identities
end
