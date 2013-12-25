# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Beefcrazy::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app20643423@heroku.com',
  :password       => 'ovbltfn2',
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
