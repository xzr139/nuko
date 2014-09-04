class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :set_locale

  def current_user
    if cookies[:token]
      @current_user = user.where(token: cookies[:token]).first
    else
      redirect_to root_path
    end
  end

  def logged_in?
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
