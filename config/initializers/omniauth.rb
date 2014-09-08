Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook.app_id, Settings.facebook.app_secret, scope: 'email,user_birthday,user_location,user_work_history', callback_path: '/auth/facebook/callback'

  on_failure do |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  end
end
