# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  fan_id     :bigint           not null
#  photo_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  # When a Like is created/destroyed, update users.likes_count
  belongs_to :fan, class_name: "User", counter_cache: true

  # Also update photos.likes_count
  belongs_to :photo, counter_cache: true
end
