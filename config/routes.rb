Rails.application.routes.draw do
  resources :albums
  devise_for :users
  root to: 'albums#get_artists'
  get '/artists', to: 'albums#get_artists', as: :artists
end
