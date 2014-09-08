Rails.application.routes.draw do

  root to: 'notes#index'
  get '/:locale' => 'notes#index'

  scope path: "(:locale)", shallow_path: "(:locale)", locale: /en|ja/ do
    resources :notes, except: [:new] , shallow: true do
      collection do
        get 'tag'
      end
    end

    resources :users, shallow: true do
      member do
        get 'all_posts'
        get 'tag'
      end
    end

    resource :stocks, only: [:create, :update], shallow: true
  end

  get '/auth/:provider/callback' => 'users#callback'
  delete '/auth/sign_out' => 'users#sign_out'
end
