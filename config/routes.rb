Rails.application.routes.draw do
  resources :albums
  devise_for :users
  root to: 'albums#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
