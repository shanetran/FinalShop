Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      :sessions => "users/sessions",
                                      :omniauth_callbacks => "users/omniauth_callbacks"}
  
  resources :users, only: [:edit, :update] do
    resources :likes
    resources :wishlists
    resources :ratings
    resources :orders do
      collection do
        get '/complete', to: 'orders#complete'
      end
    end
  end
  resources :products do
    resources :comments
  end
  resources :distributors, only: [:show]
  resources :contacts
  resources :categories
  resources :checkouts do
    member do
      get '/delivery', to: 'checkouts#delivery'
    end
  end
  resources :carts do
    member do
      get '/add', to: 'carts#add'
      get '/remove_item', to: 'carts#remove_item'
    end
    collection do
      get '/destroy', to: 'carts#destroy'
      post '/update', to: 'carts#update'
      post '/add_cart_ajax', to: 'carts#add_cart_ajax'
    end
  end

  get '/search', to: 'home#search'
  # -------------------------------------
  # ajax route
  post 'remove_product', to: 'wishlists#remove_product'
  post 'add_product', to: 'wishlists#add_product'
  post 'like', to: 'likes#like'
  post 'unlike', to: 'likes#unlike'
  # end
  #   -------------------------------------

  resource :home do
    get '/active-account', to: 'home#active_account'
    get '/active-complete', to: 'home#active_complete'
    post 'active', to: 'home#active'
  end
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  namespace :admin do
    root to: "users#index"
    resources :users, :only => [:index, :create, :update, :destroy]
    resources :products
    resources :categories
    resources :likes
    resources :comments
    resources :orders
  end

end
