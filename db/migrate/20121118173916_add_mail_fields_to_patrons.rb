class AddMailFieldsToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :mail_list_subscribe_posted_at, :datetime
    add_column :patrons, :mail_is_subscribed, :boolean, :default => false
  end
end
