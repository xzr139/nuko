class UsersController < ApplicationController
  before_action :user_params, only: [:update]
  before_action :set_user, only: [:show, :tag, :stocks]

  def switch
    cookies[:locale] = params[:locale]
    redirect_to "/" + params[:locale]
  end

  def show
    @notes = @user.notes.present? ? @user.notes.page(params[:page]).per(10).order(id: :desc) : []
  end

  def update
    current_user.update(user_params)
    sign_in(current_user,  bypass: true) if user_params["password"]

    redirect_to profile_path(current_user), notice: t("users.update.complate_update_profiles")
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nick_name, :bio, :avatar, :language, :show_company)
  end

  def set_user
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: t('users.not_found')
    end
  end
end
