# app/models/photo.rb

class Photo < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :fans, through: :likes

  validates :caption, presence: true
  validates :image, presence: true

  # Scopes
  scope :past_week, -> { where(created_at: 1.week.ago..Time.current) }
  scope :by_likes, -> { order(likes_count: :desc) }
end
