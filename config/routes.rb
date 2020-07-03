Rails.application.routes.draw do
  resources :pictures
  resources :categories
  root 'pictures#index'
end
