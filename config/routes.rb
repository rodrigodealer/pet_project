Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # match 'users/auth/facebook', to: 'omniauth_callbacks#facebook', via: [:get, :post]

  root to: 'home#index'

  get '/products',    to: 'products#index'

  namespace :admin do
    resources :products do
      get :properties_edit
      get :properties_remove
      post :properties_save
    end
  end

  post '/cart', to: 'cart#create'

  get '/cart', to: 'cart#index'

  get '/p(/:id)', to: 'products#show'

  get '/search', to: 'products#search'

  get '/healthcheck', to: 'healthcheck#index'
end
