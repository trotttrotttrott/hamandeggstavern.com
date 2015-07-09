class ChangeDateFormatInEvent < ActiveRecord::Migration
  def up
    change_column :events, :start, :date
    change_column :events, :finish, :date
  end

  def down
    change_column :events, :start, :datetime
    change_column :events, :finish, :datetime
  end
end
