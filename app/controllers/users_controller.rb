class UsersController < ApplicationController
  before_action :user_params, only: [:update]

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user), notice: t('users.update.complate_update_nick_name')
  end

  def callback
    user = User.set_data_from_omnifb_info(request.env['omniauth.auth'])
    cookies[:token] = user.token
    redirect_to edit_user_path(user.id), notice: t('common.signed_in')
  end

  def sign_out
    cookies[:token] = nil
    redirect_to root_url, notice: t('common.signed_out')
  end

  def all_posts
    if User.find(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: t('users.not_found')
    end
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :bio, :avatar)
  end
end
