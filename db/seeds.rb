# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_one = User.create(username: "Bob", password: "password")
user_two = User.create(username: "John", password: "password")
user_three = User.create(username: "Kathy", password: "password")

Follow.create(follower_id: user_one.id, followed_user_id: user_two.id)
Follow.create(follower_id: user_two.id, followed_user_id: user_one.id)
Follow.create(follower_id: user_three.id, followed_user_id: user_two.id)
Follow.create(follower_id: user_one.id, followed_user_id: user_three.id)
Follow.create(follower_id: user_three.id, followed_user_id: user_one.id)

tweet = Tweet.create(tweet: "HI EVERYONE :D", user_id: user_one.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
Tweet.create(tweet: "league of noobs", user_id: user_one.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
Tweet.create(tweet: "cant wait for elden ring!!!", user_id: user_one.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)

Tweet.create(tweet: "HI EVERYONE!", user_id: user_two.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
Tweet.create(tweet: "Anime = weeb shit lol", user_id: user_two.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
Tweet.create(tweet: "pizza yup", user_id: user_two.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
Tweet.create(tweet: "need shoes...", user_id: user_two.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)

Tweet.create(tweet: "pimp me out", user_id: user_three.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
Tweet.create(tweet: "HI EVERYONE :D", user_id: user_three.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)
Tweet.create(tweet: "HI EVERYONE :D", user_id: user_three.id, like_count: 0, comment_count: 0, retweet_count: 0, is_retweet: false)

Comment.create(text: 'cool stuff', user_id: user_three.id, tweet_id: tweet.id, like_count: 0, comment_count: 0) 
Comment.create(text: 'wow', user_id: user_two.id, tweet_id: tweet.id, like_count: 0, comment_count: 0)
Comment.create(text: 'deranged pineapple?', user_id: user_two.id, tweet_id: tweet.id, like_count: 0, comment_count: 0)

puts 'seeding done'