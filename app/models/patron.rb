class Patron < ActiveRecord::Base

  validates :email,
            :presence => true,
            :format => { :with => Devise.email_regexp },
            :uniqueness => true

  before_validation :downcase_email
  after_create :post_to_mailchimp!

  def self.find_by_email(email)
    where('lower(email) = ?', email.downcase).first
  end

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end

  def post_to_mailchimp!
    MailChimpService.list_subscribe(self)
  end
end
