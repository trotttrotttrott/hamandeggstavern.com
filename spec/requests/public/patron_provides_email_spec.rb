require 'spec_helper'

describe 'Patron provides email' do

  it 'should be able to provide a valid email', :js => true do
    visit root_path
    fill_in 'patron_email', :with => 'bobfarty@smelly.org'
    click_button 'Send'
    page.should have_content %q(You'll here from us soon...)
  end

  it 'should be rejected if an invalid email is provided' do
  end
end
