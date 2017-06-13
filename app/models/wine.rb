class Wine < ActiveRecord::Base

  default_scope { order('rank ASC') }

  has_one :producer
  belongs_to :producer

end
