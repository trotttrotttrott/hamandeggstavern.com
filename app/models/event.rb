class Event < ActiveRecord::Base
  attr_accessible :name, :from, :to, :words

  def day
    from.strftime '%m/%d/%Y'
  end
end
