class CreateFirstItems < ActiveRecord::Migration
  def change
    create_table :first_items do |t|
      t.references :first_course, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :first_items, :first_courses
    add_foreign_key :first_items, :orders
  end
end
