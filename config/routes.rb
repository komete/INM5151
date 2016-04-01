Rails.application.routes.draw do

  root 'pages#acceuil'
  get 'acceuil'      => 'pages#acceuil'
  get 'cartes'       => 'pages#cartes'
  get 'recherches'   => 'pages#recherches'
  get 'offres'       => 'pages#offres'
  get 'dashboard'    => 'pages#dashboard'
  get 'signup'       => 'users#new'
  get 'users/gestion'        => 'users#gestion'
  put 'users/:id'    => 'users#activation'
  get 'login'        => 'sessions#new'
  post 'login'       => 'sessions#create'
  delete 'logout'    => 'sessions#destroy'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'data/select'  => 'data#select'
  post 'data/import' => 'data#import'
  get 'troncon_route/select' => 'troncon_routes#select'
  post 'troncon_route/import' => 'troncon_routes#import'
  resources :works
  get 'travaux/new'
  resources :routes, only: [:index, :show]
  resources :troncon_routes, only: [:select, :index, :import, :show]
  resources :point_reperes
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :account_verifications, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

end
