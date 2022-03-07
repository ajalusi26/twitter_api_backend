class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :bio, :profile_pic, :display_name, :user_id

  belongs_to :user
end
