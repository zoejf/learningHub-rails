ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587, 
  :authentication => :plain,
  :user_name => ENV['gmail_username'],
  :password => ENV['gmail_password'],
  :enable_starttls_auto => true
}