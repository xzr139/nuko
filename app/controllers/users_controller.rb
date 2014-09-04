class UsersController < ApplicationController
  before_action :user_params, only: [:update]

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user), notice: t('users.update.complate_update_nick_name')
  end

  def callback
    user = User.set_data_from_omnifb_info(request.env['omniauth.auth'])
    cookies[:token] = user.token
    redirect_to edit_user_path(user.id)
  end

  def sign_out
    cookies[:token] = nil
    redirect_to root_url, notice:  "Log out"
  end

  def user_params
    params.require(:user).permit(:nick_name, :bio, :avatar)
  end
end
