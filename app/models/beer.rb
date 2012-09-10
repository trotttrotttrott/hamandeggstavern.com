class Beer < ActiveRecord::Base

  has_one :beer_classification
  belongs_to :beer_classification

  has_one :producer
  belongs_to :producer

end
