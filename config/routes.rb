Rails.application.routes.draw do

  root                'pages#acceuil'
  get 'acceuil'    => 'pages#acceuil'
  get 'cartes'     => 'pages#cartes'
  get 'recherches' => 'pages#recherches'
  get 'offres'     => 'pages#offres'
  get 'profil'     => 'users#new'
  get 'register'   => 'accounts#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'

  resources :accounts, :users
  resources :account_verifications, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update ]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  
end
