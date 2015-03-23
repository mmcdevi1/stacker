Rails.application.routes.draw do
  
  get 'register', to: "users#new"
  resources :users, only: [:create]

  root to: "static_pages#index"

end
