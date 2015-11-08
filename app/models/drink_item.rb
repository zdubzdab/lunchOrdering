class DrinkItem < ActiveRecord::Base
  belongs_to :drink
  belongs_to :order
  belongs_to :cart
  belongs_to :day
  belongs_to :user

  validate :order_should_has_one_drink_item, on: :create

  def total_price
    drink.price
  end

  def pull_d_course_name
    drink.name
  end

  def pull_d_course_created_at
    drink.created_at.strftime("%d")
  end

  private
    def order_should_has_one_drink_item
      if cart.drink_items.count >= 1
        errors.add(:base, "You can order only one first course")
      end
    end

end
