Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'uikit', to: 'pages#uikit'

  resources :boardgames, only: [  ]
  resources :gamenights, only: [ ]
  resources :locations, only: [  ]
  resources :participations, only: [  ]

end
