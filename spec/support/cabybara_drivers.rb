require 'capybara/rspec'

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit
# Capybara.javascript_driver = :webkit_debug

Capybara.configure do |config|
  config.default_wait_time = 2
end
