class EventParticipation < ActiveRecord::Base
  attr_accessible :event_id, :act_id, :act_rank
  belongs_to :event
  belongs_to :act
  default_scope joins(:event).order('events.start')
  scope :by_rank, order(:act_rank)
end
