Rails.application.routes.draw do

  root to: 'notes#index'
  get '/:locale' => 'notes#index'

  scope path: "(:locale)", shallow_path: "(:locale)" do
    resources :notes, except: [:new] , shallow: true do
      collection do
        get 'tag'
      end
    end

    resources :users, shallow: true do
      member do
        get 'all_posts'
        get 'tag'
        get 'stocks'
      end
    end

    resource :stocks, only: [:update], shallow: true
    resource :followers, only: [:update], shallow: true
    resources :activities, only: [:index, :update], shallow: true
    resources :comments, only: [:edit, :update, :destroy, :create], shallow: true do
      member do
        patch 'like'
        patch 'unlike'
      end
    end
  end

  get '/auth/:provider/callback' => 'users#callback'
  get '/auth/failure' => 'users#failure'
  delete '/auth/sign_out' => 'users#sign_out'
end
