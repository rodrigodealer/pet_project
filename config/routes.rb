Rails.application.routes.draw do
  root to: 'home#index'

  get '/products',    to: 'products#index'

  namespace :admin do
    resources :products do
      get :properties_edit
      get :properties_remove
      post :properties_save
    end
  end

  get '/search', to: 'products#search'

  get '/healthcheck', to: 'healthcheck#index'
end
