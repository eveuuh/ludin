Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  ActiveAdmin.routes(self)


  get 'users/:user_id/profil', to: 'pages#profil', as: :profil

  get 'dashboard', to: 'pages#dashboard'
  get 'uikit', to: 'pages#uikit'

  resources :locations, only: [ :new, :create, :edit, :update, :destroy ]
  resources :boardgames, only: [ :new, :create, :edit, :update, :destroy ]

  resources :gamenights do
    resources :participations, only: [ :create ]
  end

  resources :participations, only: [ :edit, :update, :destroy ]
end
