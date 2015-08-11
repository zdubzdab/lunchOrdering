class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :day, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :days
  end
end
