Rails.application.routes.draw do

  resources :days
  resources :orders, only: [:create]
  resources :carts, only: [:create, :destroy]
  devise_for :users
  get 'users/index'
  get 'persons/profile', as: 'user_root'
  root 'welcome#index'

  resources :drink_items, only: [:create]
  resources :second_items, only: [:create]
  resources :first_items, only: [:create]
  # match 'persons/profile',    to: 'orders#create',    via:  [:post], as: 'create_cart'
  # match 'persons/profile',    to: 'carts#destroy',    via:  [:delete], as: 'del_cart'
end
