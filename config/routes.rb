Rails.application.routes.draw do
  
  root "static_pages#home"
  get "about" => "static_pages#about"
  get "help" => "static_pages#help"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show, :update]
  namespace :admin do 
    resources :users, only: [:index, :create, :destroy]
  end
end
