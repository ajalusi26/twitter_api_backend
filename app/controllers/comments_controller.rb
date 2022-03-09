class CommentsController < ApplicationController
    
    def new_comment
        new_comment = Comment.create!(text: params[:text], user_id: params[:user_id], tweet_id: params[:tweet_id], like_count: 0, comment_count: 0)
        tweet = Tweet.find(params[:tweet_id])
        tweet.update(comment_count: tweet.comment_count + 1)
        render json: new_comment, status: :created
    end

    private

    def route_params
        params.permit(:text, :user_id, :tweet_id, :like_count, :comment_count)
    end	
end
