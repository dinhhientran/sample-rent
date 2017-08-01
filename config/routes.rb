Rails.application.routes.draw do
  resources :cars
  get 'home/index'

  devise_for :users

  root 'home#index'

  resources :houses
end
