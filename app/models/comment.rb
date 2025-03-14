class Comment < ApplicationRecord
  # Each comment belongs to an author (which is a User) and updates users.comments_count
  belongs_to :author, class_name: "User", counter_cache: true
  
  # Each comment belongs to a photo and updates photos.comments_count
  belongs_to :photo, counter_cache: true
end
