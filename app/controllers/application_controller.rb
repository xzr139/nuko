class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception

  before_action :set_locale
  helper_method :current_user, :signed_in?, :current_user?, :is_this_my_note?, :locale

  private

  def current_user
    User.find_by(token: session[:token])
  end

  def current_user?(id)
    current_user == User.find_by(id: id)
  end

  def signed_in?
    current_user != nil
  end

  def default_url_options(options={})
    if current_user && current_user.language
      { :locale => current_user.language}
    else
      { :locale => I18n.locale }
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
end
