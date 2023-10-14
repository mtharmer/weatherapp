# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root 'home#index'

  # resources :forecast, only: :show
  get 'forecast',         to: 'forecast#show'
  get 'forecast/search',  to: 'forecast#search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
