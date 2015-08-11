class DrinkItem < ActiveRecord::Base
  belongs_to :drink
  belongs_to :order
  belongs_to :day
  belongs_to :user
end
