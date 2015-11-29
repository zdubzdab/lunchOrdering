class AddOrderRefToSecondCourses < ActiveRecord::Migration
  def change
    add_reference :second_courses, :order, index: true
    add_foreign_key :second_courses, :orders
  end
end
