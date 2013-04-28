class Event < ActiveRecord::Base
  attr_accessible :name, :start, :finish, :words
  has_many :participations, :class_name => 'EventParticipation', :dependent => :destroy
  default_scope order('start asc')

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
end
