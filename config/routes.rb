# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'quotes#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :authors
  resources :books
  resources :quotes, except: %i[new show]
  resources :profiles
  resource :likes, only: %i[create destroy]
  resource :follows, only: %i[create destroy]

  namespace :admin do
    resources :quotes, only: %i[index destroy] do
      post :approve, to: 'quotes#approve'
    end
    get :pending_quotes, to: 'quotes#pending'
  end
end
