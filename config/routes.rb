Rails.application.routes.draw do
  devise_for :users
  resources :group_expenses
  resources :expenses
  resources :groups
  resources :users

  root 'groups#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
