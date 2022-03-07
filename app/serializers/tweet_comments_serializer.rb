class TweetCommentsSerializer < ActiveModel::Serializer
  attributes :id, :tweet, :user_id, :like_count, :comment_count, :retweet_count, :is_retweet, :created_at
  
  has_many :comments
end
