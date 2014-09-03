Rails.application.routes.draw do
  resources :feeds

  root to: "home#index"

  resources :home, only: [:index]
  resources :users

  get '/auth/:provider/callback' => 'users#callback'
end
