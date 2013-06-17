require 'spec_helper'

describe 'Admin creates an event' do

  let(:admin) { FactoryGirl.create(:admin, :password => 'hamhamham') }

  before do
    @act = FactoryGirl.create(:act)
  end

  it 'should be able to create an event and associate acts', :js => true do
    sign_in admin
    visit new_admin_event_path
    within '#new_event' do
      fill_in 'event_name', :with => Faker::HipsterIpsum.words
      select @act.name, :from => 'select_acts'
      click_link 'add_act_to_event'
    end
    click_button 'Save'
    page.should have_text('Event was successfully created.')
    Event.first.participations.size.should eq(1)
  end
end
