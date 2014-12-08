class Act < ActiveRecord::Base
  has_many :event_participations, :dependent => :destroy
  default_scope { order('name asc') }
end
