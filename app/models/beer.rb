class Beer < ActiveRecord::Base

  default_scope { order('rank ASC') }

  has_one :beer_classification
  belongs_to :beer_classification

  has_one :producer
  belongs_to :producer

  validate :cannot_be_shit_and_craft_can

  def cannot_be_shit_and_craft_can
    if is_shit_can && is_craft_can
      errors.add(:is_shit_can, "can't be shit if also craft")
      errors.add(:is_craft_can, "can't be craft if also shit")
    end
  end
end
