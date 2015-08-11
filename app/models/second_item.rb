class SecondItem < ActiveRecord::Base
  belongs_to :second_course
  belongs_to :order
  belongs_to :day
  belongs_to :user
end
