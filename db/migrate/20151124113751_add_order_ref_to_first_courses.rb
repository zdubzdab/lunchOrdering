class AddOrderRefToFirstCourses < ActiveRecord::Migration
  def change
    add_reference :first_courses, :order, index: true
    add_foreign_key :first_courses, :orders
  end
end
