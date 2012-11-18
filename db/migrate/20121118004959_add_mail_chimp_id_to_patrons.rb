class AddMailChimpIdToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :mail_chimp_id, :string
  end
end
