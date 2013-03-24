require 'selenium/webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app
end

Capybara.configure do |config|
  config.default_wait_time = 5
end
