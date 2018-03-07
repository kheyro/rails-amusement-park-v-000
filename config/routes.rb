Rails.application.routes.draw do
  root 'application#home'

  resources :attractions
  resources :users
  resources :rides, only: [:index, :new]

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create', as: 'post_signin'
  post 'logout' => 'sessions#destroy', as: 'logout'
  post 'rides/new' => 'rides#create'
end