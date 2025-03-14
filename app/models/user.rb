# app/models/user.rb

class User < ApplicationRecord
  # Devise modules and other configurations...
  
  # ---------------------
  # Direct Associations:
  # ---------------------
  
  # Comments created by this user (using author_id in comments table)
  has_many :comments, foreign_key: :author_id, dependent: :destroy

  # Likes created by this user (acting as fan)
  has_many :likes, foreign_key: :fan_id, dependent: :destroy

  # Photos owned by this user
  has_many :own_photos, foreign_key: :owner_id, class_name: "Photo", dependent: :destroy

  # Follow requests sent from this user
  has_many :sent_follow_requests, foreign_key: :sender_id, class_name: "FollowRequest", dependent: :destroy

  # Follow requests received by this user
  has_many :received_follow_requests, foreign_key: :recipient_id, class_name: "FollowRequest", dependent: :destroy

  # ------------------------------
  # Filtered Follow Request Scopes:
  # ------------------------------

  # Only follow requests sent that have been accepted
  has_many :accepted_sent_follow_requests, -> { where(status: "accepted") },
           foreign_key: :sender_id, class_name: "FollowRequest"

  # Only follow requests received that have been accepted
  has_many :accepted_received_follow_requests, -> { where(status: "accepted") },
           foreign_key: :recipient_id, class_name: "FollowRequest"

  # ----------------------
  # Indirect Associations:
  # ----------------------

  # Leaders: Users that this user is following (via accepted follow requests sent)
  has_many :leaders, through: :accepted_sent_follow_requests, source: :recipient

  # Followers: Users that are following this user (via accepted follow requests received)
  has_many :followers, through: :accepted_received_follow_requests, source: :sender

  # Photos liked by this user (via the Like model)
  has_many :liked_photos, through: :likes, source: :photo

  # Feed: Photos posted by the leaders that this user follows.
  # This retrieves the leaders' own_photos.
  has_many :feed, through: :leaders, source: :own_photos

  # Discover: Photos liked by the leaders that this user follows.
  # This retrieves the leaders' liked_photos.
  has_many :discover, through: :leaders, source: :liked_photos
end
