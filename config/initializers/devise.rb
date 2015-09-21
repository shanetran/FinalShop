require "omniauth-google-oauth2"
Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.scoped_views = true

  config.omniauth :facebook, "467068193466263", "bcfc5646f5a1471ae77342ed82a9549d",
                              scope: 'email', info_fields: 'email, name'
  config.omniauth :google_oauth2, "48166077951-vf88iv9olf2s92eqv0tfm1mk74l2ob94.apps.googleusercontent.com", "QGS526I2ZK6XEZIaFHmzqlp2",
                               {
                                 :scope => 'userinfo.email, userinfo.profile, https://www.googleapis.com/auth/calendar'                                                                                                                                                                                                                                                                                         
                                }
end
