require 'spec_helper'

describe 'Admin creates an event' do

  let(:admin) { FactoryGirl.create(:admin, :password => 'hamhamham') }

  it 'should be able to create an event', :js => true do
    sign_in admin
    visit new_admin_event_path
    within '#new_event' do
      fill_in 'event_name', :with => Faker::HipsterIpsum.words
    end
    click_button 'Save'
    page.should have_text('Event was successfully created.')
  end
end
