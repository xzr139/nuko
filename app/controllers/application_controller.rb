class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception

  before_action :set_locale
  helper_method :current_user, :signed_in?, :current_user?, :this_my_note?, :locale, :root_path

  private

  def current_user
    session[:token] ? User.where(token: session[:token]).first : nil
  end

  def current_user?(id)
    current_user == User.find_by(id: id)
  end

  def this_my_note?(id)
    Note.find_by(id: id).user == current_user
  end

  def signed_in?
    current_user != nil
  end

  def default_url_options
    if current_user && current_user.language
      { locale: current_user.language }
    else
      { locale: I18n.locale }
    end
  end

  def set_locale
    if current_user && current_user.language
      I18n.locale = current_user.language
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end

  def locale
    if current_user && current_user.language
      current_user.language
    else
      params[:locale] || I18n.default_locale
    end
  end

  def check_user
    redirect_to root_path, notice: t("users.have_to_sign_in") unless signed_in?
  end

  def root_path
    "/#{locale}"
  end
end
