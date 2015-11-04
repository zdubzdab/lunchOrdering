Rails.application.routes.draw do

  resources :days, only: [:create, :new, :show, :index]
  resources :orders, only: [:create]
  resources :carts, only: [:create, :destroy]
  devise_for :users
  get 'users/index'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'persons/profile', as: 'user_root'
  root 'welcome#index'

  resources :drink_items, only: [:create]
  resources :second_items, only: [:create]
  resources :first_items, only: [:create]
  # match 'persons/profile',    to: 'orders#create',    via:  [:post], as: 'create_cart'
  # match 'persons/profile',    to: 'carts#destroy',    via:  [:delete], as: 'del_cart'
end
