class Beer < ActiveRecord::Base

  default_scope { order('rank ASC') }

  has_one :beer_classification
  belongs_to :beer_classification

  has_one :producer
  belongs_to :producer

  PRICES = {
    shit_can: ENV["SHIT_CAN_PRICE"],
    draft: ENV["DRAFT_PRICE"],
    craft_can: ENV["CRAFT_CAN_PRICE"]
  }

  validate :cannot_be_shit_and_craft_can

  def cannot_be_shit_and_craft_can
    if is_shit_can && is_craft_can
      errors.add(:is_shit_can, "can't be shit if also craft")
      errors.add(:is_craft_can, "can't be craft if also shit")
    end
  end

  def self.shit_cans
    where is_shit_can: true
  end

  def self.drafts
    where is_draft: true
  end

  def self.craft_cans
    where is_craft_can: true
  end
end
