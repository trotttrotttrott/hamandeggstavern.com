class RemoveAgeRestrictionFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :age_restriction, :string
  end
end
