# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params.fetch(:username))
  end

  def liked
    @user = User.find_by!(username: params.fetch(:username))
    # For now, we assume liked_photos returns the collection of photos the user liked.
    # Make sure your User model defines `has_many :liked_photos, through: :likes, source: :photo`
  end

  # You can stub other actions similarly:
  def feed
    @user = User.find_by!(username: params.fetch(:username))
    # Logic for feed (e.g., photos from leaders)
  end

  def followers
    @user = User.find_by!(username: params.fetch(:username))
    # Logic for followers, e.g., list of users following @user
  end

  def following
    @user = User.find_by!(username: params.fetch(:username))
    # Logic for following, e.g., list of users @user is following
  end
end
