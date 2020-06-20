Rails.application.routes.draw do
  namespace :admin do
    resources :rescuer_members
    resources :support_members

    root to: "rescuer_members#index"
  end

  root to: 'toppages#index'

  namespace :supporter do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    get 'signup', to: 'support_members#new'
    post 'signup', to: 'support_members#create'
    patch 'support_members/:id/edit/', to: 'support_members#update'
    resources :support_members, except: [:destroy]
  end

  namespace :rescuestation do

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    get 'signup', to: 'rescuer_members#new'
    post 'signup', to: 'rescuer_members#create'
    patch 'rescuer_members/:id/edit/', to: 'rescuer_members#update'
    resources :rescuer_members, except: [:destroy]
  end

  resources :items, only: [:new]

  resources :rescuestation_items, only: [:show, :create, :destroy] do
    member do
      get 'dashboard', to: 'rescuestation_items#dashboard'
    end
  end

  resources :suppoter_items, only: [:show] do
    member do
      get 'dashboard', to: 'rescuestation_items#dashboard'
    end
  end
end