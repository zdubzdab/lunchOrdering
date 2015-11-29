class AddUserRefToFirstCourses < ActiveRecord::Migration
  def change
    add_reference :first_courses, :user, index: true
    add_foreign_key :first_courses, :users
  end
end
