class SecondCourse < ActiveRecord::Base
  has_many :second_items

  belongs_to :day, touch: true

  validates :name, presence: true
  validates :price, presence: true
end
