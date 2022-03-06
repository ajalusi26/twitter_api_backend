class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :tweet_id, :like_count, :comment_count
end
