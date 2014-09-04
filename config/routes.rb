Rails.application.routes.draw do

  root to: "notes#index"

  resources :notes, except: [:new]
  resources :users

  get '/auth/:provider/callback' => 'users#callback'
end
