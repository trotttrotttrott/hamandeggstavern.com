class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.integer :admin_id
      t.string :token
      t.string :type

      t.timestamps
    end
  end
end
