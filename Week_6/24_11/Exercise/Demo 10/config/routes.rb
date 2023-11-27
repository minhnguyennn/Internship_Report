Rails.application.routes.draw do
  resources :posts
  resources :employees
  root "employees#index"
end
