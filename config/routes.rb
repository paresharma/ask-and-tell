Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    resources :answers, only: %w(edit create update destroy)
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: %w(new create destroy)
end
