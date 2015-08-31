Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      :sessions => "users/sessions"}

  resources :users, only: [:edit, :update] do
    resources :likes
    resources :wishlists
    resources :ratings
  end
  resources :products do
    resources :comments
  end
  resources :categories
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

  namespace :admin do
    root to: "users#index"
    resources :users, :only => [:index, :create, :update, :destroy]
    resources :products
    resources :categories
    resources :likes
    resources :comments
  end

end
