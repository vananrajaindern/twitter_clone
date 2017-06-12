Rails.application.routes.draw do
  devise_for :users

  root 'tweets#index'

  resources :tweets, except: [:new] do
    resources :comments, only: [:new, :create]
    collection do
      get :view_followers
      get :view_followees
    end
  end

  resources :profiles, only: [:show] do
    member do
      resources :followings, only: [:create, :destroy]
    end
  end


end
