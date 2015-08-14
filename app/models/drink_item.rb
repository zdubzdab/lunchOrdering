class DrinkItem < ActiveRecord::Base
  belongs_to :drink
  belongs_to :order
  belongs_to :cart
  belongs_to :day
  belongs_to :user

  def total_price
    drink.price
  end

end
