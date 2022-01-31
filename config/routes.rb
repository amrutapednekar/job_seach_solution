Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/login'
  #get 'sessions/welcome'
  #get 'users/new'
  #get 'users/create'


  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'

  get 'authorized', to: 'sessions#page_requires_login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end