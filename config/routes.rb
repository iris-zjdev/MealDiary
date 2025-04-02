# Rails.application.routes.draw do
# get "bookmarks/create"
# get "bookmarks/destroy"
# get "likes/create"
# get "likes/destroy"
# get "sessions/new"
# get "sessions/create"
# get "sessions/destroy"
#   resources :comments
#   resources :meal_posts
#   resources :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
#   # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
#   # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

#   # Defines the root path route ("/")
#   # root "posts#index"
# end
Rails.application.routes.draw do
  root "meal_posts#index"

  resources :users
  resources :meal_posts do
    resources :comments, only: [ :create, :destroy ]
  end

  resources :likes, only: [ :create, :destroy ]
  resources :bookmarks, only: [ :create, :destroy ]

  # Sessions routes for login/logout
  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "/profile", to: "users#profile", as: "profile"
end
