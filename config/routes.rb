Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes

  get 'recipes/user_recipes/:id', to: 'recipes#user_recipes', as: :user_recipes

  get 'recipes/:id/edit_instructions', to: 'recipes#edit_instructions', as: :edit_instructions
  get 'recipes/:id/edit_ingredients', to: 'recipes#edit_ingredients', as: :edit_ingredients

  get 'users/signup', to: 'users#new'
  resources :users, except: :new

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
