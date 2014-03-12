class RenameListToGroceryItem < ActiveRecord::Migration
  def change
  	rename_table :lists, :grocery_items
  end
end
