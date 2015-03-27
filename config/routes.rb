Rails.application.routes.draw do
  
  get 'register', to: "users#new"
  resources :users, only: [:create]

  get 'login',  to: "sessions#new"
  get 'logout', to: "sessions#destroy"
  resources :sessions, only: [:create]

  root to: "static_pages#index"

end
