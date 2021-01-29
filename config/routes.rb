Rails.application.routes.draw do
  root to: 'filmes_externos#index'

  get '/series', to: 'series#index'
  get '/pessoas', to: 'pessoas#index'
  resources :filmes, only: %i[index show new create edit update]
end
