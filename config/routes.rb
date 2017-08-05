Rails.application.routes.draw do

  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }

  root 'home#index'

  resources :cars

  resources :message_threads, only: [:index, :new, :show, :create]

end
