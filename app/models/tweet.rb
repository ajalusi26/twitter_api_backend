class Tweet < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :comments

    #who liked this tweet 
    has_many :liked_tweets
    has_many :users, through: :liked_tweets
end
