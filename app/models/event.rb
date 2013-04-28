class Event < ActiveRecord::Base
  attr_accessible :name, :from, :to, :words
  has_many :participations, :class_name => 'EventParticipation'

  def participations
    super.by_rank
  end

  def date
    from.strftime '%m/%d/%Y'
  end

  def day
    from.strftime '%d'
  end

  def month
    from.strftime '%B'
  end

  def year
    from.strftime '\'%y'
  end

  def time
    "#{from.strftime '%l'} - #{to.strftime '%l%P'}"
  end

  def past?
    from.to_date.past?
  end

  def verbose
    "#{name} - #{date}"
  end
end
