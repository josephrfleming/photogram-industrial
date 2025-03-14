Rails.application.routes.draw do
  # Root route is set first
  root "photos#index"

  # Devise routes
  devise_for :users

  # Resource routes (alphabetically ordered)
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos
end
