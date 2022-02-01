Rails.application.routes.draw do
# User authentication routes
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'

  get 'authorized', to: 'sessions#page_requires_login'
  root :to => 'sessions#welcome'

  # Job routes
  resources :jobs
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
