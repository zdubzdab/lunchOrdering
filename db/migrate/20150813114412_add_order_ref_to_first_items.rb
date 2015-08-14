class AddOrderRefToFirstItems < ActiveRecord::Migration
  def change
    add_reference :first_items, :order, index: true
    add_foreign_key :first_items, :orders
  end
end
