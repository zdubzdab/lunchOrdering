class AddFirstCourseRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :first_course, index: true
    add_foreign_key :orders, :first_courses
  end
end
