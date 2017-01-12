Rails.application.routes.draw do

  #resources :users, only: [:show]

  resources :votes, only: [:create]
  
  resources :polls

  resources :products

  resources :people do
    resources :interactions, only: [:new, :create, :edit, :update]
  end

  resources :businesses do
    resources :interactions, only: [:new, :create, :edit, :update]
  end

  resources :products do
    resources :interactions, only: [:new, :create, :edit, :update]
  end
  #get 'activities/index'
  
  resources :activities
  resources :comments
  resources :microposts
  
  root 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
