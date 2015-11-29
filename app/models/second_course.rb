class SecondCourse < ActiveRecord::Base
  has_many :second_items
    has_many :orders
  belongs_to :day, touch: true
    belongs_to :user

  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01, message: :bad_price_format}
end
