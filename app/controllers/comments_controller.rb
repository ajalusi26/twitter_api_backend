class CommentsController < ApplicationController
    
    def new_comment
        new_comment = Comment.create!(text: params[:text], user_id: session[:current_user], tweet_id: params[:tweet_id], like_count: 0, comment_count: 0)
        tweet = Tweet.find(params[:tweet_id])
        tweet.update(comment_count: tweet.comment_count + 1)
        render json: new_comment, status: :created
    end

    def like_comment
        is_liked = LikedComment.find_by(user_id: session[:current_user], comment_id: params[:comment_id])
         
        if is_liked 
            comment = Comment.find(params[:comment_id])
            unless comment.like_count == 0
                comment.update!(like_count: comment.like_count -= 1) 
                is_liked.destroy
                render json: {unliked: comment.like_count}, status: :ok
            else
                render json: {unliked: 0}, status: :ok
            end
        else
            comment = Comment.find(params[:comment_id])
            comment.update!(like_count: comment.like_count += 1)
            LikedComment.create!(user_id: session[:current_user], comment_id: params[:comment_id])
            render json: {liked: comment.like_count}, status: :ok
        end
    end

    private

    def route_params
        params.permit(:text, :user_id, :tweet_id, :like_count, :comment_count)
    end	
end
