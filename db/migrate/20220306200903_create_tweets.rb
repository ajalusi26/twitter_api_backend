class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :tweet
      t.integer :user_id
      t.integer :like_count
      t.integer :comment_count
      t.integer :retweet_count
      t.boolean :is_retweet

      t.timestamps
    end
  end
end
