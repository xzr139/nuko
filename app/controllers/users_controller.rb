class UsersController < ApplicationController
  before_action :current_user, except: [:callback]

  def callback
    user = User.set_data_from_omnifb_info(request.env['omniauth.auth'])
    cookies[:token] = user.token
    redirect_to edit_user_path(user.id)
  end
end
