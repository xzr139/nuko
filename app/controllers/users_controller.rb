class UsersController < ApplicationController
  include UserActions

  before_action :user_params, only: [:update]
  before_action :set_user, only: [:show, :tag, :stocks]
  before_action :set_notes, only: [:show, :tag, :stocks]
  before_action :set_ranking, only: [:show, :tag, :stocks]

  def callback
    user = User.add_user_from_omiauth(request.env["omniauth.auth"])
    session[:token] = user.token
    if user.nick_name.present? && user.bio.present?
      redirect_to root_path, notice: t("common.signed_in")
    else
      redirect_to edit_user_path(user.id), notice: t("common.signed_in")
    end
  end

  def failure
    redirect_to root_path, notice: t('users.authentication_failed')
  end

  def sign_out
    session[:token] = nil
    redirect_to root_path, notice: t("common.signed_out")
  end
end
