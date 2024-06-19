Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # GET /about
  get "/about", to: "about#index", as: :about

  #GET /sign_up
  get "/sign_up", to: "registrations#new"
  post "/sign_up", to: "registrations#create"

  #GET /sign_in
  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"

  #GET /password
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"


  delete "logout", to: "sessions#destroy"


  #GET root
  root to: "main#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
