class Day < ActiveRecord::Base
  has_many :orders
  has_many :first_items, through: :orders
  has_many :second_items, through: :orders
  has_many :drink_items, through: :orders
  has_many :first_courses
  has_many :second_courses
  has_many :drinks

  extend SimpleCalendar
  has_calendar
end
