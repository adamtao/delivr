Delivr::Application.routes.draw do

  root :to => "home#index"

  # Browsing
  resources :categories do 
    member do
      patch :delete_banner
    end
  end
  resources :items do 
	  resources :item_documents, only: :destroy
	  resources :item_images, only: [:show, :update, :destroy]
	  resources :downloads, only: :destroy
  end
  get 'items/new/:category_id' => 'items#new', as: :new_category_item
  get 'download/:timestamp/:id/:hash.:extension' => 'downloads#download', as: :download_file
  match 'support' => 'home#support', as: :support_form, via: :all

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
  get   'forgot_password', to: 'sessions#forgot_password'
  post  'forgot_password', to: 'sessions#forgot_password'
  get   'reset_password/:password_reset_digest', to: 'sessions#reset_password', as: :reset_password
  post  'reset_password/:password_reset_digest', to: 'sessions#reset_password'
  patch 'update_password', to: 'profile#update_password'
	get   'my_collection', to: 'profile#show', as: 'profile'
	get   'profile/edit', to: 'profile#edit', as: 'edit_profile'
	patch 'profile/update', to: 'profile#update', as: 'update_profile'
  resources :identities

  get 'sitemap(.:format)' => 'home#sitemap', as: :sitemap, format: :xml
  get 'robots(.:format)'  => 'home#robots',  as: :robots,  format: :text

  # Admin stuff
  get "admin", to: 'admin#index', as: 'admin_root'

end
