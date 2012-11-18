class MailChimpService < BaseService

  LIST_ID ||= ENV['MAILCHIMP_PATRON_LIST_ID']

  def self.list_subscribe(patron)
    begin
      if Gibbon.list_subscribe(:id => LIST_ID, :email_address => patron.email)
        patron.mail_list_subscribe_posted_at = Time.now
        patron.save(:validate => false)
      end
    rescue => exception
      Rails.logger.error exception
      false
    end
  end
end
