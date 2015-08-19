class Cart < ActiveRecord::Base
  has_many :first_items
  has_many :second_items
  has_many :drink_items

  belongs_to :user
  belongs_to :day

  def total_price
    total = []
    total << first_items.to_a.sum { |item| item.total_price }
    total << second_items.to_a.sum { |item| item.total_price }
    total << drink_items.to_a.sum { |item| item.total_price }
    total.sum
  end

end
