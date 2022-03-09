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
  get '/user_feed/:user_id', to: 'tweets#user_feed'

  #write a tweet || new comment
  post '/new_tweet', to: 'tweets#new_tweet'
  post '/new_comment', to: 'comments#new_comment'

  #like/unlike tweet or comment
  post '/like_tweet', to: 'tweets#like_tweet'
  post '/like_comment', to: 'comments#like_comment'
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
