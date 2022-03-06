Rails.application.routes.draw do
  
  resources :users
  resources :tweets
  resources :profiles
  resources :liked_tweets
  resources :liked_comments
  resources :follows
  resources :comments
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
