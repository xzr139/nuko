class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  helper_method :current_user
  helper_method :signed_in?
  helper_method :current_user?
  helper_method :is_this_my_note?

  def current_user
    cookies[:token] ? User.where(token: cookies[:token]).first : nil
  end

  def current_user?(id)
    current_user == User.find_by(id: id)
  end

  def is_this_my_note?(id)
    Note.find_by(id: id).user == current_user
  end

  def signed_in?
    current_user != nil
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  # リンクの多言語化に対応する
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
