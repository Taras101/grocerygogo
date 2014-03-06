class AddValidFromAndValidToToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :valid_from, :datetime
    add_column :prices, :valid_to, :datetime
  end
end
