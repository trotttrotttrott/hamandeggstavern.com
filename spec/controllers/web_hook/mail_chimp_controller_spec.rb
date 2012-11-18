require 'spec_helper'

describe WebHook::MailChimpController do

  let(:patron) { FactoryGirl.create(:patron) }

  it 'should update a patron on profile requests' do

    profile_update_params = {
      type: "profile",
      fired_at: "2009-03-26 21:31:21",
      data: {
        id: "8a25ff1d98",
        list_id: "a6b5da1054",
        email: patron.email,
        email_type: "html",
        merges: {
          EMAIL: patron.email,
          FNAME: Faker::Name.first_name,
          LNAME: Faker::Name.last_name,
          INTERESTS: "Group1,Group2",
          ip_opt: Faker::Internet.ip_v4_address } } }

    get :receiver, profile_update_params

    patron.reload
    patron.first_name.should eq(profile_update_params[:data][:merges][:FNAME])
    patron.last_name.should eq(profile_update_params[:data][:merges][:LNAME])
  end

  it 'should update a patron\'s email on email update requests' do

    email_update_params = {
      type: "upemail",
      fired_at: "2009-03-26\ 22:15:09",
      data: {
        list_id: "a6b5da1054",
        new_id: "51da8c3259",
        new_email: Faker::Internet.email,
        old_email: patron.email } }

    get :receiver, email_update_params

    patron.reload
    patron.email.should eq(email_update_params[:data][:new_email])
  end
end
