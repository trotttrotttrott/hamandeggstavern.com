class Patron < ActiveRecord::Base

  validates :email,
            :presence => true,
            :format => { :with => Devise.email_regexp },
            :uniqueness => true

  after_create :post_to_mailchimp

  private

  def post_to_mailchimp
    MailChimpService.list_subscribe(self)
  end
end
