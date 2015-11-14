class SecondItem < ActiveRecord::Base
  belongs_to :second_course
  belongs_to :order
  belongs_to :day
  belongs_to :cart
  belongs_to :user

  validate :order_should_has_one_second_item, on: :create

  def total_price
    second_course.price
  end

  def pull_s_course_name
    second_course.name
  end

  def pull_s_course_created_at
    second_course.created_at.strftime("%d")
  end

  private
    def order_should_has_one_second_item
      if cart.second_items.count >= 1
        errors.add(:base, "You can order only one first course")
      end
    end

end
