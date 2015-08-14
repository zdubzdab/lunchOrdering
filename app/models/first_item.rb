class FirstItem < ActiveRecord::Base
  belongs_to :first_course
  belongs_to :cart
  belongs_to :order
  belongs_to :day
  belongs_to :user

  def total_price
    first_course.price
  end

end
