# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = 'cfae3e937f52c1443067a1e22ae712d5f018e36dd0a3abed8ea7126e94356e548e5c1c7054601d34e9bc0bbb3887c870d12ea24a9858c7fce07c321234741607'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :get

  config.omniauth :facebook, '596654090544487', '0151eb6a7e18702d8b74590a6c7c07ff', scope: 'email,public_profile', info_fields: 'email,public_profile'
end
