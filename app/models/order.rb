class Order < ActiveRecord::Base
  has_many :first_items
  has_many :second_items
  has_many :drink_items
  belongs_to :user
  belongs_to :day

  validate :order_should_has_at_least_one_item, :user_can_order_courses_from_today_menu, on: :create

  def add_items_from_cart(cart)
    cart.first_items.each do |f_items|
      f_items.cart_id = nil
      first_items << f_items
    end
    cart.second_items.each do |sec_items|
      sec_items.cart_id = nil
      second_items << sec_items
    end
    cart.drink_items.each do |dr_items|
      dr_items.cart_id = nil
      drink_items << dr_items
    end

  end

  def order_total_price
    total = [] << first_items.to_a.sum { |item| item.total_price }
    total << second_items.to_a.sum { |item| item.total_price }
    total << drink_items.to_a.sum { |item| item.total_price }
    total.sum
  end

  def pull_course_name
    total = [] << first_items.to_a.sum { |item| item.pull_f_course_name }
    total << second_items.to_a.sum { |item| item.pull_s_course_name }
    total << drink_items.to_a.sum { |item| item.pull_d_course_name }
    total.join(" , ").gsub(/[0]/, '-')
  end

  def pull_first_course_name
    total = [] << first_items.to_a.sum { |item| item.pull_f_course_name }
    total.join.gsub(/[0]/, '-')
  end

 def pull_second_course_name
    total = [] << second_items.to_a.sum { |item| item.pull_s_course_name }
    total.join.gsub(/[0]/, '-')
  end

   def pull_drink_course_name
    total = [] << drink_items.to_a.sum { |item| item.pull_d_course_name }
    total.join.gsub(/[0]/, '-')
  end

  private
    def order_should_has_at_least_one_item
      if first_items.empty? && second_items.empty? && drink_items.empty?
          errors.add(:base, "")
      end
    end

    def user_can_order_courses_from_today_menu
      f = first_items.to_a.sum { |item| item.pull_f_course_created_at }
      s = second_items.to_a.sum { |item| item.pull_s_course_created_at }
      d = drink_items.to_a.sum { |item| item.pull_d_course_created_at }
      if f.blank?
        f = Time.now.strftime("%d")
        if s.blank?
          s = Time.now.strftime("%d")
          if d.blank?
            d = Time.now.strftime("%d")
            if f != Time.now.strftime("%d") || s != Time.now.strftime("%d") || d != Time.now.strftime("%d")
                errors.add(:base, "")
            end
          end
        end
      end
    end

end
