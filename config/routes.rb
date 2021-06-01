Rails.application.routes.draw do
  resources :studios, only: [ :show ] do
    resources :movies, only: [ :show ]
  end

  resources :movies, only: [ :show ]

  post '/movies/:id/actors', to: 'movies#add_actor'
end
