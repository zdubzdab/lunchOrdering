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

  get 'persons/index'
  post 'persons/profile',  to: 'persons#create_cart', as: 'create_cart'
  # match 'persons/profile',  to: 'persons#delete_session', via:  [:delete], as: 'delete_session'
end
