class RenameStartToDateInEvents < ActiveRecord::Migration
  def up
    rename_column :events, :start, :date
  end
  def down
    rename_column :events, :date, :start
  end
end
