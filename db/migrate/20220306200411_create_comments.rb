class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :tweet_id
      t.integer :like_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
