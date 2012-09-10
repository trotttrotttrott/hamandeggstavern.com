class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :description
      t.float :percentage_of_alcohol
      t.string :image
      t.integer :producer_id
      t.integer :beer_classification_id

      t.timestamps
    end
  end
end
