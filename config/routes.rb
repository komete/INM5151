Rails.application.routes.draw do

  root                'pages#acceuil'
  get 'acceuil'    => 'pages#acceuil'
  get 'cartes'     => 'pages#cartes'
  get 'recherches' => 'pages#recherches'
  get 'offres'     => 'pages#offres'
  get 'dashboard'  => 'pages#dashboard'
  get 'signup'     => 'users#new'
  get 'users'      => 'users#gestion'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'password_resets/new'
  get 'password_resets/edit'

  resources :users, only: [:new, :create, :edit, :destroy]
  resources :account_verifications, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update ]

end
