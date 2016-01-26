Rails.application.routes.draw do
  root to: 'notes#index'
  get '/:locale' => 'notes#index'

  devise_for :users, skip: [:session, :password, :registration, :confirmation], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope path: "(:locale)", shallow_path: "(:locale)" do
    devise_for :users, skip: :omniauth_callbacks, controllers: { registrations: 'users/registrations' }

    resource :stocks, only: [:update], shallow: true
    resource :followers, only: [:update], shallow: true
    resources :searches, only: [:index], shallow: true
    resources :users, only: [:edit, :update], shallow: true
    resources :activities, only: [:index, :update], shallow: true
    resources :tags, only: [:index], shallow: true do
      member do
        patch 'follow'
      end
    end

    get 'tag/:name' => 'tags#show', as: 'tag'

    resources :profiles, only: [:show, :update, :edit], shallow: true do
      member do
        get 'all_posts'
        get 'tag'
        get 'stocks'
      end
    end

    resources :comments, only: [:edit, :update, :destroy, :create], shallow: true
    resources :notes, shallow: true do
      collection do
        get 'public'
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    resource :notes, only: :none do
      member do
        post 'preview'
      end
    end
  end

  patch "/switch" => 'users#switch'
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
