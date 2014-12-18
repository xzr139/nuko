Rails.application.routes.draw do

  root to: 'notes#index'
  get '/:locale' => 'notes#index'

  scope path: "(:locale)", shallow_path: "(:locale)" do


    resource :stocks, only: [:update], shallow: true
    resource :followers, only: [:update], shallow: true
    resources :searches, only: [:index], shallow: true
    resources :users, only: [:edit, :update], shallow: true
    resources :activities, only: [:index, :update], shallow: true

    resources :profiles, only: [:show, :update, :edit], shallow: true do
      member do
        get 'all_posts'
        get 'tag'
        get 'stocks'
      end
    end

    resources :comments, only: [:edit, :update, :destroy, :create], shallow: true do
      member do
        patch 'like'
        patch 'unlike'
      end
    end

    resources :notes, except: [:new] , shallow: true do
      collection do
        get 'tag'
      end
    end
  end

  get '/auth/:provider/callback' => 'users#callback'
  get '/auth/failure' => 'users#failure'
  delete '/auth/sign_out' => 'users#sign_out'
end
