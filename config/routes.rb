Rails.application.routes.draw do
  devise_for :users

  root 'tweets#index'

  resources :tweets do
    resources :comments, only: [ :new, :create ]
  end

  resources :profiles, only: [ :show ]

end
