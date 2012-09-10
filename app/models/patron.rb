class Patron < ActiveRecord::Base
  validates :email,
            :presence => { :message => %q(can't be blizank.) },
            :format => { :with => Devise.email_regexp, :message => %q(can't be nonsense.) },
            :uniqueness => { :message => %q(is already in the d-base. Thanks for your interest.) }
end
