class AddNameToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :first_name, :string
    add_column :patrons, :last_name, :string
  end
end
