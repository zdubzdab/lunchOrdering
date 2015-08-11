class CreateSecondItems < ActiveRecord::Migration
  def change
    create_table :second_items do |t|
      t.references :second_course, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :second_items, :second_courses
    add_foreign_key :second_items, :orders
  end
end
