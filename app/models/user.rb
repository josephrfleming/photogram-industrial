class User < ApplicationRecord
  # Devise modules, etc.

  # Photos, comments, etc.
  has_many :own_photos, class_name: "Photo", foreign_key: "owner_id"

  # Follow requests this user SENT
  has_many :sent_follow_requests, 
           class_name: "FollowRequest", 
           foreign_key: "sender_id", 
           dependent: :destroy

  # Follow requests this user RECEIVED
  has_many :received_follow_requests, 
           class_name: "FollowRequest", 
           foreign_key: "recipient_id", 
           dependent: :destroy
end
