Rails.application.routes.draw do

  root to: 'notes#index'
  get '/:locale' => 'notes#index'

  scope "/:locale" do
    resources :books
    resources :notes, except: [:new] do
      collection do
        get 'tag'
      end
    end

    resources :users do
      member do
        get 'all_posts'
        get 'tag'
      end
    end
  end

  get '/auth/:provider/callback' => 'users#callback'
  get '/auth/failure' => 'users#failure'
  delete '/auth/sign_out' => 'users#sign_out'
end
