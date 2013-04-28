class AddAgeRestrictionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :age_restriction, :string, :default => '21 +'
  end
end
