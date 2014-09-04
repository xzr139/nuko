Rails.application.routes.draw do
  root to: "home#index"

  resources :home, only: [:index]
  resources :users

  get '/auth/:provider/callback' => 'users#callback'
  delete '/auth/sign_out' => 'users#sign_out'
end
