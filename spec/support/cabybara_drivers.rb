require 'selenium/webdriver'

Capybara.register_driver :mobile do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['general.useragent.override'] = "iPhone"

  Capybara::Selenium::Driver.new(app, :profile => profile, :resynchronize => true)
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :resynchronize => true)
end

Capybara.configure do |config|
  config.default_wait_time = 5
end
