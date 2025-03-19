Rails.application.routes.draw do
  root "photos#index"

  devise_for :users
  
  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

  # This route maps a URL like "/alice" to the users#show action.
  get "/:username" => "users#show", as: :user
end
