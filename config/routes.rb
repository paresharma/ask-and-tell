Rails.application.routes.draw do
  root to: 'home#show'

  resources :questions do
    resources :answers, only: %w(create update destroy)
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
end
