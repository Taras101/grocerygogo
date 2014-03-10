class AddProductIdToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :product_id, :integer
    add_column :prices, :store_id, :integer
  end
end
