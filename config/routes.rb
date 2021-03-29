Rails.application.routes.draw do
  resources :attractions
  resources :rides
  resources :users
  
  root 'static#home'
  
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
