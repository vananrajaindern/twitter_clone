Rails.application.routes.draw do
  devise_for :users

  root "tweets#index"

  resources :tweets, except: [ :show ]

  resources :profiles, only: [ :show ]

end
