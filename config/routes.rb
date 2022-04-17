Rails.application.routes.draw do
  root to: "image#index"
  resources :image,     only: [:index, :new, :create, :destroy]
  resources :container, only: [:index, :new, :create, :destroy]
  get "/container/start/:id", to: "container#start"
  get "/container/stop/:id", to: "container#stop"
end