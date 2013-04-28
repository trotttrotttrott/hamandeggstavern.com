class EventParticipation < ActiveRecord::Base
  attr_accessible :event_id, :act_id, :act_rank
  belongs_to :event
  belongs_to :act
  scope :by_rank, order(:act_rank)
end
