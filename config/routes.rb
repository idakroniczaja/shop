Rails.application.routes.draw do
  # GET / about
  get "about", to: "about#index"

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'

  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  resources :twitter_accounts

  root to:"main#index"

end
