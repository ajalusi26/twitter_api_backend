class TweetsController < ApplicationController
    
    #user feed with author of each tweet (with profile info)
    def user_feed
        following = User.find(params[:id]).followings
        feed = [] 
        following.map do |user|
          user.user_tweets.map{|i| feed << i}  
        end   
        render json: feed, status: :ok
    end

    private
   
    def route_params
        params.permit(:id, :tweet, :user_id, :like_count, :comment_count, :retweet_count, :is_retweet)
    end
end
