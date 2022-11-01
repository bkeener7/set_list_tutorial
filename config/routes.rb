Rails.application.routes.draw do
  # get '/songs', to: 'songs#index'
  # get '/songs/:id', to: 'songs#show'

  # get '/artists/:artist_id/songs', to: 'artist_songs#index'

  # get '/artists', to: 'artists#index'
  # get '/artists/:id', to: 'artists#show'
  # get '/artists/new', to: 'artists#new'
  # post '/artists', to: 'artists#create'
  # get '/artists/:id/edit', to: 'artists#edit'
  patch '/artists/:id', to: 'artists#update'
  # delete '/artists/:id', to: 'artists#destroy'

  # get '/playlists', to: "playlists#index", as: "playlists"

  resources :songs, only: %i[index show]
  resources :artists, except: [:update] do
    resources :songs, only: [:index], controller: 'artist_songs'
  end
  resources :playlists, only: [:index]

  # resources :artists, only: [:show, :update, :destroy]

  # namespace :artists do
  #   resources :songs
  # end

  # scope :artists do
  #   resources :songs
  # end

  # scope module: :artists do
  #   resources :songs
  # end
end
