Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/:user_id/profil', to: 'pages#profil', as: :profil

  get 'dashboard', to: 'pages#dashboard'
  get 'contact', to: 'pages#contact'
  get 'uikit', to: 'pages#uikit'

  resources :locations, only: [ :new, :create, :edit, :update, :destroy ]
  resources :boardgames, only: [ :new, :create, :edit, :update, :destroy ]

  resources :gamenights do
    resources :participations, only: [ :create ]
  end

  resources :participations, only: [ :edit, :update, :destroy ]
end
