Rails.application.routes.draw do

  root "static_pages#home"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"\

  delete "/logout", to: "sessions#destroy"

  resources :users

  resources :entries, only: [:create, :destroy]

  resources :entries, only: [:create, :destroy]

  resources :relationships, only: [:create, :destroy, :index]

  resources :comments, only: [:create]

end
