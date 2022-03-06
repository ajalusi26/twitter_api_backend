class User < ApplicationRecord
    has_secure_password
  
    #creates user_instance.followers | returns all users who follows user instance
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    has_many :followers, through: :received_follows, source: :follower
  
    #creates user_instance.followings | returns all users the instance is following
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
    has_many :followings, through: :given_follows, source: :followed_user
  
  
    #user_instance.user_tweets | returns all tweets writen by user instance
    has_many :user_tweets, foreign_key: :user_id, class_name: 'Tweet'
  
    #liked comments | get all liked comments from custom method user_liked_comments
    has_many :liked_comments
    has_many :comments, through: :liked_comments
  
    #liked tweets (need to fix; needs custom association name)
    has_many :liked_tweets
    has_many :tweets, through: :liked_tweets
    # has_many :user_liked_tweets, foreign_key: :user_id, class_name: 'Tweet', through: :liked_tweets, class_name: 'LikedTweet'
    
  
    #user profile
    has_one :profile, dependent: :destroy
  
    # user_instance.comments | retuns all comments writen by user
    has_many :comments, dependent: :destroy
  
    
    def user_liked_tweets
      self.liked_tweets.map{|i| i.tweet}
    end
  
    def user_liked_comments
      self.liked_comments.map{|i| i.comment}
    end
  
    def correct=(p)
      if self&.authenticate(p)
        puts 'ur in'
      else
        puts 'not in lmao'
      end
    end
end
