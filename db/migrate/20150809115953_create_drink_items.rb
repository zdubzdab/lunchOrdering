class CreateDrinkItems < ActiveRecord::Migration
  def change
    create_table :drink_items do |t|
      t.references :drink, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :drink_items, :drinks
    add_foreign_key :drink_items, :orders
  end
end
