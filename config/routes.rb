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
    resources :support_members, except: [:destroy]
  end

  namespace :rescuestation do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    get 'signup', to: 'rescuer_members#new'
    post 'signup', to: 'rescuer_members#create'
    resources :rescuer_members, except: [:destroy]
  end

  resources :items, only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]
end


