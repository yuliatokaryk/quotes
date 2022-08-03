Rails.application.routes.draw do
  devise_for :users
  resources :authors
  resources :books
end
