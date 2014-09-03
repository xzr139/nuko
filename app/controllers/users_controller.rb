class UsersController < ApplicationController
  before_action :current_user, except: [:callback]

  def callback
    token = User.set_data_from_omnifb_info(request.env['omniauth.auth']).token
    cookies[:token] = token
    redirect_to root_path
  end
end
