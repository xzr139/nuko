class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  def cancel
    super
  end

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def after_sign_up_path_for(*)
    edit_profile_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:nick_name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:nick_name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
