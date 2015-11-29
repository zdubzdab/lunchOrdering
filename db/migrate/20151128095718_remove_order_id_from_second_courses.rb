class RemoveOrderIdFromSecondCourses < ActiveRecord::Migration
  def change
    remove_column :second_courses, :order_id, :integer
  end
end
