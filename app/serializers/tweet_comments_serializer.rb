class TweetCommentsSerializer < ActiveModel::Serializer
  attributes :id, :tweet, :user_id, :like_count, :comment_count, :retweet_count, :is_retweet, :created_at
  
  has_many :comments
  has_one :user, through: :comments
  has_one :profile, through: :user
end
