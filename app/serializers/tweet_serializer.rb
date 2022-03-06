class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet, :user_id, :like_count, :comment_count, :retweet_count, :is_retweet
end
