Rails.application.routes.draw do
  #get 'sessions/new'

  #get 'sessions/index'

  #get 'sessions/show'


  get 'static_pages/home'
  root to: 'static_pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show], controller: 'users/users'
  resources :courses
  resources :sessions
end
