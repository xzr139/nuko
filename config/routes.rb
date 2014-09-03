Rails.application.routes.draw do

  root to: "home#index"

  resources :feeds, except: [:new]
  resources :users

  get '/auth/:provider/callback' => 'users#callback'
end
