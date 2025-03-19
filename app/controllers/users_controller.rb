# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def show
    # Use find_by! so that if no user is found, Rails raises an ActiveRecord::RecordNotFound error,
    # which produces a 404 response.
    @user = User.find_by!(username: params.fetch(:username))
  end
end
