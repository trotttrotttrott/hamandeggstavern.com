class RenameEventsFromToToStartFinish < ActiveRecord::Migration
  def up
    rename_column :events, :from, :start
    rename_column :events, :to, :finish
  end

  def down
    rename_column :events, :start, :from
    rename_column :events, :finish, :to
  end
end
