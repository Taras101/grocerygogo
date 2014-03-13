class AddPositionToGroceryItems < ActiveRecord::Migration
  def change
    add_column :grocery_items, :position, :integer
  end
end
