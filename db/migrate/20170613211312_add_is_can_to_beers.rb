class AddIsCanToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :is_can, :boolean
  end
end
