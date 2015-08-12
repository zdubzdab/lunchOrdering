class FirstCourse < ActiveRecord::Base
  has_many :first_items

  belongs_to :day, touch: true
end
