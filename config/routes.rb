Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'uikit', to: 'pages#uikit'

  resources :locations, only: [ :new, :create, :edit, :update, :destroy ]

  resources :boardgames, only: [ :new, :create, :edit, :update, :destroy ] do
    resources :gamenights, only: [ :new, :create, :edit, :update ]
  end

  resources :gamenights, only: [ :index, :show, :destroy ]
  resources :participations, only: [  ]

end
