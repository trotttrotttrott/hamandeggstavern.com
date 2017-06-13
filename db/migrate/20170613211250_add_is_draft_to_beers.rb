class AddIsDraftToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :is_draft, :boolean
  end
end
