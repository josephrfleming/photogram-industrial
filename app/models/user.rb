class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Direct associations
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :fan_id, dependent: :destroy
  
  # FollowRequest associations
  has_many :sent_follow_requests, foreign_key: :sender_id, class_name: "FollowRequest", dependent: :destroy
  has_many :received_follow_requests, foreign_key: :recipient_id, class_name: "FollowRequest", dependent: :destroy
  has_many :accepted_sent_follow_requests, -> { where(status: "accepted") },
           foreign_key: :sender_id, class_name: "FollowRequest"
  has_many :accepted_received_follow_requests, -> { where(status: "accepted") },
           foreign_key: :recipient_id, class_name: "FollowRequest"

  # Indirect associations
  has_many :leaders, through: :accepted_sent_follow_requests, source: :recipient
  has_many :followers, through: :accepted_received_follow_requests, source: :sender
  has_many :liked_photos, through: :likes, source: :photo

  # **This is the missing association:**
  has_many :own_photos, foreign_key: :owner_id, class_name: "Photo", dependent: :destroy

  # Additional indirect associations for feed and discover, if applicable
  has_many :feed, through: :leaders, source: :own_photos
  has_many :discover, through: :leaders, source: :liked_photos

  validates :username, presence: true, uniqueness: true
end
