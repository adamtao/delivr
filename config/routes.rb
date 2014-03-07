Delivr::Application.routes.draw do

  root :to => "home#index"

  # Browsing
  resources :categories
  resources :items do 
	  resources :item_documents, only: :destroy
	  resources :item_images, only: [:show, :update, :destroy]
	  resources :downloads, only: :destroy
  end
  get 'items/new/:category_id' => 'items#new', as: :new_category_item
  get 'downloads/:id/download' => 'downloads#download', as: :download_file

  # Shopping Cart
  post  'cart/add/:id'    => 'cart#add',    as: :add_to_cart
  get   'cart/remove/:id' => 'cart#remove', as: :remove_from_cart
  patch 'cart/update'     => 'cart#update', as: :update_cart
  get   'cart'            => 'cart#view',   as: :view_cart

  get   'checkout' => 'checkout#index', as: :checkout
  match 'checkout/finalize' => 'checkout#finalize', as: :finalize_checkout, via: :all
  get   'checkout/order_confirmation/:id' => 'checkout#order_confirmation', as: :order_confirmation

  # User actions
	match 'auth/:provider/callback', to: 'sessions#create', via: :all
	get   'auth/failure', to: 'sessions#failure'
	get   'signin', to: 'sessions#new', as: 'new_session'
	get   'signout', to: 'sessions#destroy', as: 'signout'
	get   'my_collection', to: 'profile#show', as: 'profile'
	get   'profile/edit', to: 'profile#edit', as: 'edit_profile'
	patch 'profile/update', to: 'profile#update', as: 'update_profile'
  resources :identities

  # Admin stuff
  get "admin", to: 'admin#index', as: 'admin_root'

end
