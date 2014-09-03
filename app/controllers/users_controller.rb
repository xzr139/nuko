class UsersController < ApplicationController
  def callback
    User.set_data_from_omnifb_info(request.env['omniauth.auth'])
    redirect_to root_path
  end
end
