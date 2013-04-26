class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :from
      t.datetime :to
      t.string :words

      t.timestamps
    end
  end
end
