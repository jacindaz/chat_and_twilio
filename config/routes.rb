Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # for devise
  root to: "rooms#index"

  resources :rooms
  resources :posts
end
