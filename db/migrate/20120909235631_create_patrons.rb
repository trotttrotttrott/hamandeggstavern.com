class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :email

      t.timestamps
    end
  end
end
