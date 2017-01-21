Rails.application.routes.draw do
  root to: 'home#index'

  get '/healthcheck', to: 'healthcheck#index'
end
