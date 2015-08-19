Rails.application.routes.draw do


namespace :admin do
  resources :days
end
  resources :orders

  resources :drink_items

  resources :second_items

  resources :first_items

  resources :carts

  devise_for :users
  get 'persons/profile', as: 'user_root'
  get 'persons/index'
  # match 'persons/profile',    to: 'orders#create',    via:  [:post], as: 'create_cart'
  # match 'persons/profile',    to: 'carts#destroy',    via:  [:delete], as: 'del_cart'
  root 'welcome#index'

end
