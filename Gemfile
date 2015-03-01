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
  gem 'pry-debugger'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end
