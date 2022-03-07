class TweetsController < ApplicationController
    
    #user feed with author of each tweet (with profile info)
    def user_feed
        feed = []
        user =  User.find(params[:id])
        following = user.followings
        # following << user
        following.map do |x|
          x.user_tweets.map{|i| feed << i}  
        end   
      
        
        render json: feed, status: :ok
    end

    def show
        tweet = Tweet.find(params[:id])
        render json: tweet, serializer: TweetCommentsSerializer ,status: :ok
    end

    private
   
    def route_params
        params.permit(:id, :tweet, :user_id, :like_count, :comment_count, :retweet_count, :is_retweet)
    end
end
