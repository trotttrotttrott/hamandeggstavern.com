require 'spec_helper'

describe WebHook::MailChimpController do

  let(:patron) { FactoryGirl.create(:patron, :mail_is_subscribed) }

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
          INTERESTS: "Group1,Group2" },
        ip_opt: Faker::Internet.ip_v4_address } }

    get :receiver, profile_update_params

    patron.reload
    patron.first_name.should eq(profile_update_params[:data][:merges][:FNAME])
    patron.last_name.should eq(profile_update_params[:data][:merges][:LNAME])
  end

  it 'should update a patron\'s email on upemail requests' do

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

  it 'should update or create a patron on subscribe requests' do

    email = Faker::Internet.email

    subscribe_params = {
      type: "subscribe",
      fired_at: "2009-03-26 21:35:57",
      data: {
        id: "8a25ff1d98",
        list_id: "a6b5da1054",
        email: email,
        email_type: "html",
        merges: {
          EMAIL: email,
          FNAME: Faker::Name.first_name,
          LNAME: Faker::Name.last_name,
          INTERESTS: "Group1,Group2"
        },
        ip_opt: "10.20.10.30",
        ip_signup: "10.20.10.30" } }

    get :receiver, subscribe_params

    patron = Patron.find_by_email(email)
    patron.mail_is_subscribed?.should eq(true)
  end

  it 'should update a patron\'s mail_is_subscribed attribute on unsubscribe requests' do

    unsubscribe_params = {
      type: "unsubscribe",
      fired_at: "2009-03-26 21:40:57",
      data: {
        action: "unsub",
        reason: "manual",
        id: "8a25ff1d98",
        list_id: "a6b5da1054",
        email: patron.email,
        email_type: "html",
        merges: {
          EMAIL: patron.email,
          FNAME: Faker::Name.first_name,
          LNAME: Faker::Name.last_name,
          INTERESTS: "Group1,Group2",
        },
        ip_opt: "10.20.10.30",
        campaign_id: "cb398d21d2",
        reason: "hard" } }

    get :receiver, unsubscribe_params

    patron.reload
    patron.mail_is_subscribed?.should_not eq(true)
  end
end
