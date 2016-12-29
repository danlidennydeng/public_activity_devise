Rails.application.routes.draw do
  
  #get 'activities/index'
  
  resources :activities
  resources :comments
  resources :microposts
  
  root 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
