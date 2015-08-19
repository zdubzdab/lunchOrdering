class DrinkItem < ActiveRecord::Base
  belongs_to :drink
  belongs_to :order
  belongs_to :cart
  belongs_to :day
  belongs_to :user

  def total_price
    drink.price
  end

  validate :order_should_has_one_drink_item, on: :create

  private 
    def order_should_has_one_drink_item
      if cart.drink_items.count >= 1
        errors.add(:base, "You can order only one first course")
      end
    end

end
