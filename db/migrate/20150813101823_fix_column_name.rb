class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :first_items, :order_id, :cart_id
    rename_column :second_items, :order_id, :cart_id
    rename_column :drink_items, :order_id, :cart_id
  end
end
