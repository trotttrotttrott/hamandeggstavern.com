class EventParticipation < ActiveRecord::Base
  belongs_to :event
  belongs_to :act
  default_scope { joins(:event).order('events.date') }
  scope :by_rank, -> { order(:act_rank) }
  validates :act_id, :uniqueness => { :scope => :event_id, :message => 'must be unique per event' }
end
