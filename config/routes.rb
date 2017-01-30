Rails.application.routes.draw do
  root to: 'home#index'

  get '/products',    to: 'products#index'

  get '/healthcheck', to: 'healthcheck#index'
end
