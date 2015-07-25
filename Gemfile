source 'http://rubygems.org'

ruby '2.2.0'

gem 'rails'
gem 'pg'
gem 'devise'
gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'
gem 'unicorn'
gem 'foreman'
gem 'gibbon' # mail chimp api wrapper
gem 'chronic' # easy datetime
gem 'kaminari' # pagination
gem 'carrierwave' # image uploads
gem 'fog' # s3 for carrierwave
gem 'mini_magick'

group :assets do
  gem 'sprockets', '2.11.0' # 2.12.x is broken
  gem 'sprockets-rails'
  gem 'sass-rails'
  gem 'compass_twitter_bootstrap'
  gem 'compass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'therubyracer'
end

group :development, :test do
  gem 'ffaker'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'dotenv-rails', :groups => [:development, :test]
end

group :production do
  gem 'rails_12factor'
end
