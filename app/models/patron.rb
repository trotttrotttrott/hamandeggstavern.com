class Patron < ActiveRecord::Base
  validates :email,
            :presence => true,
            :format => { :with => Devise.email_regexp },
            :uniqueness => true
end
