Rails.application.routes.draw do
  resources :albums
  devise_for :users
  root to: 'albums#fetch_artists'
  get '/artists', to: 'albums#fetch_artists', as: :artists
end
