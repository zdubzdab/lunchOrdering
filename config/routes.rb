Rails.application.routes.draw do
  # resources :drink_items

  # resources :second_items

  # resources :first_items
    resources :first_courses, :only => [:create]
    resources :second_courses, :only => [:create]
    resources :drinks, :only => [:create]

  resources :days

  resources :orders

  # match '/days/new',    to: 'days#create',    via:  [:post]

  devise_for :users
  get 'persons/profile'#, as: 'user_root'

  root 'welcome#index'

end
