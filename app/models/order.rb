class Order < ActiveRecord::Base
  has_many :first_items
  has_many :second_items
  has_many :drink_items
  belongs_to :user
  belongs_to :day

  def add_items_from_cart(cart)
    cart.first_items.each do |items|
      items.cart_id = nil
      first_items << items
    end
    cart.second_items.each do |item|
      item.cart_id = nil
      second_items << item
    end
    cart.drink_items.each do |itemq|
      itemq.cart_id = nil
      drink_items << itemq
    end
  end

  def total_price
    total = []
    total << first_items.to_a.sum { |item| item.total_price }
    total << second_items.to_a.sum { |item| item.total_price }
    total << drink_items.to_a.sum { |item| item.total_price }
    total.sum
  end

  def pull_course_name
    total = []
    total << first_items.to_a.sum { |item| item.pull_course_name }
    total << second_items.to_a.sum { |item| item.pull_course_name }
    total << drink_items.to_a.sum { |item| item.pull_course_name }
  end

end