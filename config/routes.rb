Rails.application.routes.draw do

  root to: 'notes#index'
  get '/:locale' => 'notes#index'

  scope "/:locale" do
    resources :books
    resources :notes, except: [:new]
    resources :users do
      member do
        get 'all_posts'
      end
    end
  end

  get '/auth/:provider/callback' => 'users#callback'
  delete '/auth/sign_out' => 'users#sign_out'
end
