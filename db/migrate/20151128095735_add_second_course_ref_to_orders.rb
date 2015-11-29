class AddSecondCourseRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :second_course, index: true
    add_foreign_key :orders, :second_courses
  end
end
