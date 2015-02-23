class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception

  before_action :set_locale
  helper_method :current_user?, :my_note?, :locale, :root_path

  unless Rails.env.development? || Rails.env.test?
    rescue_from Exception,                        with: :render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :render_404
    rescue_from ActionController::RoutingError,   with: :render_404
  end

  private

  def current_user?(id)
    current_user == User.find_by(id: id)
  end

  def my_note?(id)
    Note.find_by(id: id).user == current_user
  end

  def default_url_options
    if current_user && current_user.language
      { locale: current_user.language }
    else
      { locale: I18n.locale }
    end
  end

  def set_locale
    if User::INTERFACE_LANGUAGE.map(&:last).include?(params['locale']) || params["locale"].blank?
      I18n.locale = (current_user && current_user.language) ?  current_user.language : params["locale"]
    else
      fail ActiveRecord::RecordNotFound
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
    redirect_to root_path, notice: t("users.have_to_sign_in") unless user_signed_in?
  end

  def authenticated_user?(user)
    user_signed_in? && user == current_user
  end

  def root_path
    "/#{locale}"
  end

  def routing_error
    fail ActionController::RoutingError.new(params['path'])
  end

  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.xhr?
      render json: { error: '404 error' }, status: 404
    else
      format = params[:format] == :json ? :json : :html
      render template: 'errors/error_404', formats: format, status: 404, layout: 'application', content_type: 'text/html'
    end
  end

  def render_500(e = nil)
    logger.info "Rendering 500 with exception: #{e.message}" if e

    if request.xhr?
      render json: { error: '500 error' }, status: 500
    else
      format = params[:format] == :json ? :json : :html
      render template: 'errors/error_500', formats: format, status: 500, layout: 'application', content_type: 'text/html'
    end
  end

  def after_sign_in_path_for(resource)
    if session["facebook_data"] && current_user.facebook_id.nil?
      User.merge_facebook_account(current_user, session["facebook_data"], session["facebook_work_data"])
    end

    session.keys.grep(/^facebook\./).each { |key| session.delete(key) }

    super
  end
end
