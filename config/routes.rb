Rails.application.routes.draw do
  resources :containers
  root to: 'home#index'
end