Rails.application.routes.draw do
  root "photos#index"

  devise_for :users
  
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

  # Friendly routes for user profile collections.
  get "/:username/liked"     => "users#liked", as: :liked
  get "/:username/feed"      => "users#feed",  as: :feed
  get "/:username/followers" => "users#followers", as: :followers
  get "/:username/following" => "users#following", as: :following

  # This should remain last (fallback route for a user profile)
  get "/:username"           => "users#show", as: :user
end
