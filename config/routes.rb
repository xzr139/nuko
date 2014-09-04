Rails.application.routes.draw do

  root to: "notes#index"

  resources :notes, except: [:new]
  resources :users do
    member do
      get 'all_posts'
    end
  end

  get '/auth/:provider/callback' => 'users#callback'
  delete '/auth/sign_out' => 'users#sign_out'
end
