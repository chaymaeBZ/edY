Rails.application.routes.draw do
 

  #get 'sessions/new'

  #get 'sessions/index'
  
  resources :sessions do
    collection do
      get 'statistics'
    end
  end

  get 'static_pages/home'
   devise_scope :user do 
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end
  root to: 'static_pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, controller: 'users/users' do
    member do
      get 'sessions'
    end
  end
  resources :courses

  resources :charges, only: [:new, :create, :index]
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]
end
