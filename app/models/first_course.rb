class FirstCourse < ActiveRecord::Base
  has_many :first_items

  belongs_to :day, touch: true

  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01, message: :bad_price_format}
end
