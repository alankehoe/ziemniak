Ziemniak::Application.routes.draw do
  use_doorkeeper
  apipie

  root :to => 'layouts#index'

  namespace :api do
    get '/me', to: 'me#index'
    put '/me', to: 'me#update'

    resources :users
    resources :samples
  end

  match '*path', to: 'layouts#index', via: [:get, :post, :put, :delete]
end
