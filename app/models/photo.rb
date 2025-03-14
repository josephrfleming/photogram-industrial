# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  image          :string
#  caption        :text
#  likes_count    :integer          default(0)
#  comments_count :integer          default(0)
#  owner_id       :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Photo < ApplicationRecord
  # Bumps the users.photos_count if you have a column for that (owner's photos_count).
  # Only do this if you actually have a "photos_count" column on users!
  belongs_to :owner, class_name: "User", counter_cache: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
