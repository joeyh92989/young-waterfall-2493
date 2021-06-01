Rails.application.routes.draw do
  resources :studios, only: [:show]
end
