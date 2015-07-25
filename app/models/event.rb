class Event < ActiveRecord::Base

  has_many :participations, :class_name => 'EventParticipation', :dependent => :destroy

  default_scope { order('date asc') }

  accepts_nested_attributes_for :participations, :reject_if => :participation_exists?

  validates :date, uniqueness: true

  mount_uploader :poster, PosterUploader

  def participations
    super.by_rank
  end

  def date_formatted
    date.strftime '%m/%d/%Y'
  end

  def day
    date.strftime '%d'
  end

  def month
    date.strftime '%B'
  end

  def year
    date.strftime '\'%y'
  end

  def past?
    date.to_date.past?
  end

  private

  def participation_exists?(attrs)
    participations.map(&:act_id).include?(attrs[:act_id].to_i)
  end
end
