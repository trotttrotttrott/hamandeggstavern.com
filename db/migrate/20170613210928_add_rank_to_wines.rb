class AddRankToWines < ActiveRecord::Migration
  def change
    add_column :wines, :rank, :integer
  end
end
