class Event < ActiveRecord::Base

  has_many :participations, :class_name => 'EventParticipation', :dependent => :destroy

  default_scope { order('start asc') }

  accepts_nested_attributes_for :participations, :reject_if => :participation_exists?

  def participations
    super.by_rank
  end

  def date
    start.strftime '%m/%d/%Y'
  end

  def day
    start.strftime '%d'
  end

  def month
    start.strftime '%B'
  end

  def year
    start.strftime '\'%y'
  end

  def time
    "#{start.strftime '%l'} - #{finish.strftime '%l%P'}"
  end

  def past?
    start.to_date.past?
  end

  def verbose
    "#{name} - #{date}"
  end

  private

  def participation_exists?(attrs)
    participations.map(&:act_id).include?(attrs[:act_id].to_i)
  end
end
