class User < ApplicationRecord
  # Devise modules and other configurations…

  # A user creates many comments (using author_id, not user_id)
  has_many :comments, foreign_key: :author_id, dependent: :destroy

  # Follow requests this user SENT (as sender)
  has_many :sent_follow_requests, foreign_key: :sender_id, class_name: "FollowRequest", dependent: :destroy

  # Follow requests this user RECEIVED (as recipient)
  has_many :received_follow_requests, foreign_key: :recipient_id, class_name: "FollowRequest", dependent: :destroy

  # A user (as a fan) can like many photos
  has_many :likes, foreign_key: :fan_id, dependent: :destroy

  # Photos owned by this user (note the custom method name)
  has_many :own_photos, foreign_key: :owner_id, class_name: "Photo", dependent: :destroy
end
