Rails.application.routes.draw do

  resources :days
  resources :orders
  resources :drink_items
  resources :second_items
  resources :first_items
  resources :carts

  get 'users/index'

  devise_for :users
  get 'persons/profile', as: 'user_root'

  # match 'persons/profile',    to: 'orders#create',    via:  [:post], as: 'create_cart'
  # match 'persons/profile',    to: 'carts#destroy',    via:  [:delete], as: 'del_cart'
  root 'welcome#index'

end
