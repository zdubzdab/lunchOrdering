class Cart < ActiveRecord::Base
  has_many :first_items, dependent: :destroy
  has_many :second_items, dependent: :destroy
  has_many :drink_items, dependent: :destroy

  belongs_to :user
  belongs_to :day

  def cart_total_price
    total = [] << first_items.to_a.sum { |item| item.total_price }
    total << second_items.to_a.sum { |item| item.total_price }
    total << drink_items.to_a.sum { |item| item.total_price }
    total.sum
  end

end
