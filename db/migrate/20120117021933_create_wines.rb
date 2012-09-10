class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :description
      t.float :percentage_of_alcohol
      t.integer :points
      t.string :image
      t.integer :producer_id

      t.timestamps
    end
  end
end
