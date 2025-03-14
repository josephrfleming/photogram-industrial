# app/models/follow_request.rb
class FollowRequest < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender,    class_name: "User"
end
