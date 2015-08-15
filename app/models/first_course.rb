class FirstCourse < ActiveRecord::Base
  has_many :first_items

  belongs_to :day, touch: true

  validates :name, presence: true
  validates :price, presence: true
end
