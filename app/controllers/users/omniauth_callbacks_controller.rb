class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if user && user.persisted?
      flash[:notice] = t("devise.omniauth_callbacks.success", kind: "Facebook")
      sign_in_and_redirect user, event: :authentication
    else
      session["facebook_data"] = request.env["omniauth.auth"].except("extra")
      session["facebook_work_data"] = request.env["omniauth.auth"]["extra"]["raw_info"]["work"][0].except("description")

      redirect_to new_user_session_url
    end
  end

  def failure
    redirect_to root_path, notice: t('users.authentication_failed')
  end
end
