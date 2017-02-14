Rails.application.routes.draw do
  get 'events/index'

  resources :comments
  resources :todos
  resources :projects
  resources :users
  resources :teams

  root to: 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
