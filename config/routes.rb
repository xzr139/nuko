Rails.application.routes.draw do
  root to: "home#index"

  resources :home, only: [:index]
  resource :users

  get '/auth/:provider/callback' => 'users#callback'
end
