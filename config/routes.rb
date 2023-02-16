Rails.application.routes.draw do
  get "/home", to: "static_pages#home"
  root "gossips#index"
  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
end
