class Wine < ActiveRecord::Base

  has_one :producer
  belongs_to :producer

end
