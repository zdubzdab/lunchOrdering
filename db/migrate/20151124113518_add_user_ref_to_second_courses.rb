class AddUserRefToSecondCourses < ActiveRecord::Migration
  def change
    add_reference :second_courses, :user, index: true
    add_foreign_key :second_courses, :users
  end
end
