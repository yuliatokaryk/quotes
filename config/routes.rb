Rails.application.routes.draw do
  root to: "quotes#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :authors
  resources :books
  resources :quotes, except: [:new, :show]
  resources :profiles
  resource :likes, only: [:create, :destroy]
  resource :followers, only: [:create, :destroy]

  namespace :admin do
    resources :quotes, only: [:index, :destroy] do
      post :approve, to: 'quotes#approve'
    end
    get :pending_quotes, to: 'quotes#pending'
  end
end
