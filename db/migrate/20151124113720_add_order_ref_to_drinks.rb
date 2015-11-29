class AddOrderRefToDrinks < ActiveRecord::Migration
  def change
    add_reference :drinks, :order, index: true
    add_foreign_key :drinks, :orders
  end
end
