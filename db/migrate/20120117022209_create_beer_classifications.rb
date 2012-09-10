class CreateBeerClassifications < ActiveRecord::Migration
  def change
    create_table :beer_classifications do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
