# frozen_string_literal: true

Rails.application.routes.draw do
  resources :addresses
  resources :employees
  resources :books
  resources :users
  resources :customers
  
  get 'up' => 'rails/health#show', as: :rails_health_check

  # get 'welcome/index'

  root 'welcome#index'

 end
