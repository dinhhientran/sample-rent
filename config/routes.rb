Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :cars

  get 'messages/index'
  get 'messages/new'
  get 'messages/send'
end
