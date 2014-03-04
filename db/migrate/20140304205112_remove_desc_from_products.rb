class RemoveDescFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :desc, :string
  end
end
