ActionMailer::Base.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587,
  :user_name => Rails.application.secrets.mandrill_username,
  :password  => Rails.application.secrets.mandrill_key,
  :domain    => Rails.application.secrets.mandrill_domain,
  :authentication => "login"
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
