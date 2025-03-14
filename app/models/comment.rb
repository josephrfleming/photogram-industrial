# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  photo_id   :bigint           not null
#
class Comment < ApplicationRecord
  # We want to update users.comments_count whenever a comment is created or destroyed
  belongs_to :author, class_name: "User", counter_cache: true

  # We also want to update photos.comments_count similarly
  belongs_to :photo, counter_cache: true
end
