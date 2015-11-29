class AddDrinkRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :drink, index: true
    add_foreign_key :orders, :drinks
  end
end
