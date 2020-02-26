Rails.application.routes.draw do
  resources :posts
  resources :games
  post "/join_game", to: "games#join_game"
  resources :users
  resources :auth, only: [:show, :create]
  # post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
