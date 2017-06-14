class AddIsCraftCanToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :is_craft_can, :boolean
  end
end
