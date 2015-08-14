class AddOrderRefToSecondItems < ActiveRecord::Migration
  def change
    add_reference :second_items, :order, index: true
    add_foreign_key :second_items, :orders
  end
end
