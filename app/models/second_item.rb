class SecondItem < ActiveRecord::Base
  belongs_to :second_course
  belongs_to :order
  belongs_to :cart
  belongs_to :day
  belongs_to :user

  def total_price
    second_course.price
  end

end
