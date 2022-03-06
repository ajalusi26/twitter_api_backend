class Comment < ApplicationRecord
          # from who on what tweet
          belongs_to :user, class_name: 'User'
          belongs_to :tweet
      
          #who liked the comment
          has_many :liked_comments
          has_many :users, through: :liked_comments
end
