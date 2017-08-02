Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :cars

  get 'message_threads/index'
  get 'messages/compose'
  get 'messages/send'
end
