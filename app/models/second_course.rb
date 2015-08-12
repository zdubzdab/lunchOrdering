class SecondCourse < ActiveRecord::Base
  has_many :second_items

  belongs_to :day, touch: true
end
