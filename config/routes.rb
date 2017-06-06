Rails.application.routes.draw do
  devise_for :users

  root 'tweets#index'

  resources :tweets, except: [ :new ] do
    resources :comments, only: [ :new, :create ]
  end

  resources :profiles, only: [ :show ]

end
