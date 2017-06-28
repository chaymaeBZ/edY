Rails.application.routes.draw do
 

  #get 'sessions/new'

  #get 'sessions/index'

  #get 'sessions/show'


  get 'static_pages/home'
  root to: 'static_pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, controller: 'users/users' do
    member do
      get 'sessions'
    end
  end
  resources :courses
  resources :sessions do
    collection do
      get 'statistics'
    end
  end
  resources :charges, only: [:new, :create, :index]
end
