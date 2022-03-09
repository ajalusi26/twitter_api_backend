class Tweet < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_one :profile, through: :user
    has_many :comments

    #who liked this tweet 
    has_many :liked_tweets
    has_many :users, through: :liked_tweets\

    validates :like_count, numericality: {greater_than_or_equal_to: 0}
end
