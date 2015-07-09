class ChangeWordsToText < ActiveRecord::Migration
  def up
    change_column :events, :words, :text
  end
  def down
    change_column :events, :words, :string
  end
end
