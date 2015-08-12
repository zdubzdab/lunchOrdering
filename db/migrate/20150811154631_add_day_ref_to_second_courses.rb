class AddDayRefToSecondCourses < ActiveRecord::Migration
  def change
    add_reference :second_courses, :day, index: true
    add_foreign_key :second_courses, :days
  end
end
