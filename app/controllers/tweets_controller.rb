class TweetsController < ApplicationController
    
    #user feed with author of each tweet (with profile info)
    def user_feed
       
        feed = []
        # user =  User.find(session[:current_user])
        user =  User.find(session[:current_user])
        following = user.followings
        
        following.map do |x|
          x.user_tweets.map{|i| feed << i}  
        end   
      
        user.user_tweets.map{|i| feed << i}

        feed = feed.sort_by { |a| -a.id }
        render json: feed, status: :ok
    end

    def show
        tweet = Tweet.find(params[:id])
        render json: tweet, serializer: TweetCommentsSerializer ,status: :ok
    end

    def new_tweet
        new_tweet = Tweet.create!(tweet: params[:tweet], user_id: session[:current_user], like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
        render json: new_tweet, status: :created
    end

    #like & unlike tweets

    

    def like_tweet
        liked = LikedTweet.find_by(user_id: session[:current_user], tweet_id: params[:tweet_id])
        if liked
            tweet = Tweet.find(params[:tweet_id])
            
            tweet.update(like_count: tweet.like_count -= 1)
            liked.destroy
            if tweet.valid?
                render json: {unliked: tweet.like_count}, status: :ok
            else
                render json: {unliked: 0}, status: :ok
            end
            
        else
            tweet = Tweet.find(params[:tweet_id])
            tweet.update(like_count: tweet.like_count += 1)
            LikedTweet.create!(user_id: session[:current_user], tweet_id: params[:tweet_id])
            render json: {liked: tweet.like_count}, status: :ok
        end
       
      
       
    end

    private
   
    def route_params
        params.permit(:id, :tweet, :user_id, :like_count, :comment_count, :retweet_count, :is_retweet)
    end
end
