class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if cookies[:token]
      @current_user = User.where(token: cookies[:token]).first
    else
      redirect_to root_path
    end
  end
end
