class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    if cookies[:token]
      @current_user = User.where(token: cookies[:token]).first
    else
      redirect_to root_path
    end
  end

  def signed_in?
    current_user != nil
  end
end
