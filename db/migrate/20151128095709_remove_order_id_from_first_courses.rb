class RemoveOrderIdFromFirstCourses < ActiveRecord::Migration
  def change
    remove_column :first_courses, :order_id, :integer
  end
end
