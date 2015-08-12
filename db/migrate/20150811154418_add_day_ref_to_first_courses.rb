class AddDayRefToFirstCourses < ActiveRecord::Migration
  def change
    add_reference :first_courses, :day, index: true
    add_foreign_key :first_courses, :days
  end
end
