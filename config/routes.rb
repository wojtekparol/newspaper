Rails.application.routes.draw do

  devise_for :admins
  root 'articles#index'
  resources :articles
  resources :comments
  
end
