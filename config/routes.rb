Rails.application.routes.draw do
  resource :session
  resources :password_resets, only: [:new, :edit, :create, :update], param: :token

  resources :games
  resources :users do
    resource :profile_picture, only: [:edit, :update, :destroy]
    resource :password, only: [:edit, :update]
  end
  resource :leaderboard, only: [:show]

  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"

  get "/profile", to: "users#show"
  get "/profile/edit", to: "users#edit"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker

  # Defines the root path route ("/")
  root "games#index"
end
