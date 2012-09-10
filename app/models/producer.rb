class Producer < ActiveRecord::Base

  has_many :beers
  has_many :wines

end
