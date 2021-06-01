Rails.application.routes.draw do
  resources :studios, only: [ :show ] do
    resources :movies, only: [ :show ]
  end
end
