class Drink < ActiveRecord::Base
  has_many :drinks_items

  belongs_to :day, touch: true

  validates :name, presence: true
  validates :price, presence: true
end
