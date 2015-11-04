class FirstItem < ActiveRecord::Base
  belongs_to :first_course
  belongs_to :cart
  belongs_to :order
  belongs_to :day
  belongs_to :user

  validate :order_should_has_one_first_item, on: :create

  def total_price
    first_course.price
  end

  def pull_f_course_name
    first_course.name
  end

  private 
    def order_should_has_one_first_item
      if cart.first_items.count >= 1
        errors.add(:base, "You can order only one first course")
      end
    end

end
