Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
