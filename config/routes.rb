Rails.application.routes.draw do
  resources :feeds

  root to: "home#index"

  resources :users

  get '/auth/:provider/callback' => 'users#callback'
end
