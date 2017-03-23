Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  root to: 'home#index'

  get '/products',    to: 'products#index'

  namespace :admin do
    resources :product_tags
    resources :products do
      get :properties_edit
      get :properties_remove
      post :properties_save
    end
  end

  get '/profile', to: 'users#profile'
  resources :addresses

  patch '/profile', to: 'users#update_profile'

  post '/cart', to: 'cart#create'

  get '/cart', to: 'cart#index'

  get '/p(/:id)', to: 'products#show', as: 'product'

  get '/search', to: 'products#search'

  post '/search', to: 'products#search_from_post'
  get '/search/:name', to: 'products#search'

  get '/healthcheck', to: 'healthcheck#index'
end
