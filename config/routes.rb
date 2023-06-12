Rails.application.routes.draw do
  # route to test your configuration
  get '/hello', to: 'application#hello_world'

  get '*path',
      to: 'fallback#index',
      constraints: ->(req) { !req.xhr? && req.format.html? }

  resources :profiles, only: [:create, :show, :update, :destroy]
  resources :games, only: [:index, :create, :show, :destroy]
  resources :game_logs, only: [:show, :update, :destroy]
  resources :genre, only: [:index]
  

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'

end
