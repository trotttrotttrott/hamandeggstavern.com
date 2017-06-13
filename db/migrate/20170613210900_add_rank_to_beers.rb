class AddRankToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :rank, :integer
  end
end
