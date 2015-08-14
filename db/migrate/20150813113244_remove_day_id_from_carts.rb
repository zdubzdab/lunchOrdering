class RemoveDayIdFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :day_id, :integer
  end
end
