class AddUrlToActs < ActiveRecord::Migration
  def change
    add_column :acts, :url, :string
  end
end
