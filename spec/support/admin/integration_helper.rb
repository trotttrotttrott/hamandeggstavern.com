module RSpec
  module Rails
    module IntegrationHelpers
      module RoleAuth
        def sign_in(admin)
          visit new_admin_session_path
          within '#new_admin' do
            fill_in 'admin_email', :with => admin.email
            fill_in 'admin_password', :with => admin.password
          end
          click_button('Log in')
          page.should have_text('GOHAM')
        end
      end
    end
    if ::Rails.env.test?
      RSpec.configure do |config|
        config.include IntegrationHelpers::RoleAuth, file_path: /\bspec\/features\/admin\//
      end
    end
  end
end
