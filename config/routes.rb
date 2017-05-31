Rails.application.routes.draw do
  devise_for :users

  resources :tweets, only: [ :index ]

  root "tweets#index"

end
