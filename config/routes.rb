Rails.application.routes.draw do
  root to: "quotes#index"
  devise_for :users
  resources :authors
  resources :books
  resources :quotes
  resource :profile
end
