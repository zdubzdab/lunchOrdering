class AddOrderRefToDrinkItems < ActiveRecord::Migration
  def change
    add_reference :drink_items, :order, index: true
    add_foreign_key :drink_items, :orders
  end
end
