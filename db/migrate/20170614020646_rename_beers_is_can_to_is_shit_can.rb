class RenameBeersIsCanToIsShitCan < ActiveRecord::Migration
  def change
    rename_column :beers, :is_can, :is_shit_can
  end
end
