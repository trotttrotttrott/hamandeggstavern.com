class WebHook::MailChimpController < ApplicationController

  def receiver

    case params[:type]
    when 'profile'
      profile
    when 'upemail'
      upemail
    when 'subscribe'
      subscribe
    when 'unsubscribe'
      unsubscribe
    end

    render :nothing => true
  end

  private

  def profile
    return unless patron = Patron.find_by_email(params[:data][:email])
    patron.first_name = params[:data][:merges][:FNAME]
    patron.last_name = params[:data][:merges][:LNAME]
    patron.save!
  end

  def upemail
    return unless patron = Patron.find_by_email(params[:data][:old_email])
    patron.email = params[:data][:new_email]
    patron.save!
  end

  def subscribe
    patron = Patron.find_by_email(params[:data][:email]) || Patron.new(:email => params[:data][:email])
    patron.first_name = params[:data][:merges][:FNAME] unless params[:data][:merges][:FNAME].blank?
    patron.last_name = params[:data][:merges][:FNAME] unless params[:data][:merges][:LNAME].blank?
    patron.mail_is_subscribed = true
    patron.save!
  end

  def unsubscribe
    return unless patron = Patron.find_by_email(params[:data][:email])
    patron.mail_is_subscribed = false
    patron.save!
  end
end
