Rails.application.routes.draw do
  
  resources :users
  resources :tweets
  resources :profiles
  resources :liked_tweets
  resources :liked_comments
  resources :follows
  resources :comments

    #log in/out
    post '/login', to: 'session#login'
    get '/logout', to: 'session#logout'
    get 'is_logged_in', to: 'session#is_logged_in'

  # get users feed 
  get '/user_feed/:id', to: 'tweets#user_feed'


  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
