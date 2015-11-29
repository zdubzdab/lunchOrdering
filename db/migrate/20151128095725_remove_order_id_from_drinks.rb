class RemoveOrderIdFromDrinks < ActiveRecord::Migration
  def change
    remove_column :drinks, :order_id, :integer
  end
end
