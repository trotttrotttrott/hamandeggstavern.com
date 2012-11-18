source 'http://rubygems.org'

gem 'rails'

gem 'devise'

gem 'haml'
gem 'haml-rails'

gem 'jquery-rails'

gem 'thin'

gem 'gibbon' # mail chimp api wrapper

group :assets do
  gem 'sprockets'
  gem 'sass-rails'
  gem 'compass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'therubyracer'
end

group :development, :test do
  gem 'mysql2'
  gem 'debugger'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'ffaker'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capistrano'
  gem 'spork'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
end

group :production do
  gem 'pg' # heroku
end
