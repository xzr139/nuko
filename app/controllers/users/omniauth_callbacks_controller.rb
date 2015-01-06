class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      session[:token] = user.token
      redirect_to new_user_registration_url
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
