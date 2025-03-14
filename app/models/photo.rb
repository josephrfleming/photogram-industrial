class Photo < ApplicationRecord
  # The owner is a User (with a custom foreign key and counter cache)
  belongs_to :owner, class_name: "User", counter_cache: true

  # A photo can have many comments
  has_many :comments, dependent: :destroy

  # A photo can have many likes
  has_many :likes, dependent: :destroy
end
