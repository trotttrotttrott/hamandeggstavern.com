class RemoveFinishFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :finish, :date
  end
end
