Rails.application.routes.draw do
  #get 'artists/index'
  #get 'artists/show'

  root 'songs#index'
  #get 'songs/index'
  match '/songs',  to: 'songs#index', via: 'get'
  match '/artists',  to: 'artists#index', via: 'get'
  resource :artists, only: [:index, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
