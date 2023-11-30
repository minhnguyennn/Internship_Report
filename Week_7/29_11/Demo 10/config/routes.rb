# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employees
  root 'employees#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
