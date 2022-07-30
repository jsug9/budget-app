Rails.application.routes.draw do
  resources :group_expenses
  resources :expenses, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show]

  root 'groups#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
