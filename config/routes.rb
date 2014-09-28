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
<<<<<<< HEAD
    resources :activities, only: [:index, :update], shallow: true
=======
>>>>>>> 3b5917814d0e13de03f0431e6ae5671460e7e6fd
  end

  get '/auth/:provider/callback' => 'users#callback'
  get '/auth/failure' => 'users#failure'
  delete '/auth/sign_out' => 'users#sign_out'
end
