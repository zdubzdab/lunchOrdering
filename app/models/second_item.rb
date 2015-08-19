class SecondItem < ActiveRecord::Base
  belongs_to :second_course
  belongs_to :order
  belongs_to :cart
  belongs_to :day
  belongs_to :user

  def total_price
    second_course.price
  end

  validate :order_should_has_one_second_item, on: :create

  private 
    def order_should_has_one_second_item
      if cart.second_items.count >= 1
        errors.add(:base, "You can order only one first course")
      end
    end

end
