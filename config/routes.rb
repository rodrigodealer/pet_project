Rails.application.routes.draw do
  root to: 'home#index'

  get '/products',    to: 'products#index'

  namespace :admin do
    resources :products
  end

  get '/healthcheck', to: 'healthcheck#index'
end
