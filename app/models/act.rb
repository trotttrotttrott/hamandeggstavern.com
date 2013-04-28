class Act < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :event_participations, :dependent => :destroy
end
